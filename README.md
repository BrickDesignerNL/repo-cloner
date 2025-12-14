# repo-cloner

A Windows batch script to clone repositories from GitHub, Hugging Face, or ModelScope by simply pasting the repository URL.

## Description

The `download.bat` script automates the process of cloning Git repositories. It prompts the user to input a repository URL, parses the URL to extract the domain, publisher, and repository name, and then clones the repository into a structured directory on the current drive under the base path `[Artificial Intelligence]\`.

### Supported Platforms
- GitHub (github.com)
- Hugging Face (huggingface.co)
- ModelScope (modelscope.cn)

The script organizes cloned repositories by domain and publisher, creating directories as needed.

## Requirements
- Windows operating system (due to .bat file format)
- Git installed and available in the PATH
- Access to the current drive

## Usage
1. Run the `download.bat` file (double-click or execute from command prompt).
2. When prompted, enter the full repository URL (e.g., `https://github.com/user/repository`).
3. The script will:
   - Parse the URL.
   - Navigate to the appropriate directory on the current drive.
   - Create the publisher directory if it doesn't exist.
   - Clone the repository using `git clone`.

## Examples

### GitHub
```
What repo would you like to clone? https://github.com/microsoft/VibeVoice
```
This will clone the repository into `[Artificial Intelligence]\github\microsoft\VibeVoice\` on the current drive.

### Hugging Face
```
What repo would you like to clone? https://huggingface.co/microsoft/VibeVoice-Realtime-0.5B
```
This will clone the repository into `[Artificial Intelligence]\huggingface\microsoft\VibeVoice-Realtime-0.5B\` on the current drive.

### ModelScope
```
What repo would you like to clone? https://modelscope.cn/models/microsoft/VibeVoice-7B
```
This will clone the repository into `[Artificial Intelligence]\modelscope.cn\models\microsoft\VibeVoice-7B\` on the current drive.

## Notes
- The script assumes the base path `[Artificial Intelligence]\` on the current drive exists or can be created.
- If the domain is not recognized, it defaults to the base directory.
- Ensure you have write permissions to the current drive.
