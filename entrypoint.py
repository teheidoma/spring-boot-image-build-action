import re
import subprocess
import os

sdkman_dir = "/root/.sdkman"
sdkman_init_script = "/root/.sdkman/bin/sdkman-init.sh"
#
input_jdk_dist = os.environ.get("INPUT_JDK_DIST")
github_output_file = os.environ.get("GITHUB_OUTPUT")

subprocess.run(f"""bash -c \"\\
SDKMAN_DIR={sdkman_dir}; source {sdkman_init_script} \\
&& sdk install java {input_jdk_dist}\"
""", shell=True)
subprocess.run(["chmod", "+x", "./gradlew"])
process = subprocess.run(["./gradlew", "bootBuildImage"], stdout=subprocess.PIPE, text=True)

# Get output and print
output = process.stdout
print(output)

pattern = r'^Successfully built image \'(.+):(.+)\'$'
match = re.search(pattern, output, re.MULTILINE)
if match:
    image_name = match.group(1)
    image_tag = match.group(2)
else:
    exit(1)


with open(github_output_file, "a") as output_file:
    output_file.write(f"IMAGE_NAME={image_name}\n")
    output_file.write(f"IMAGE_TAG={image_tag}\n")


subprocess.run(["docker", "push", f"{image_name}:{image_tag}"])
