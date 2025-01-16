# Pitch Mean Extraction Script - README

## Overview
This script processes TextGrid files along with their corresponding sound files to extract the mean pitch of labeled intervals. The results are saved in a tab-delimited text file.

## Author and Acknowledgments
- **Author**: Wellington Mendes (UFU, 2024) wellington.mendes@ufu.br
- (http://www.portal.ileel.ufu.br/pessoas/docentes/wellington-araujo-mendes-junior)
- (https://scholar.google.com/citations?user=eI4709wAAAAJ&hl=pt-BR)
- **Based On**: 
  - "duration_multiple.praat" by Mietta Lennes (http://www.helsinki.fi/~lennes/praat-scripts/)
  - Modified by Maria Cantoni (UFMG, 2016)
- **License**: GNU General Public License

## Features
- Reads TextGrid files and their matching sound files from specified directories.
- Extracts the mean pitch (in Hz) for labeled intervals in a user-specified tier.
- Saves results to a user-defined text file.

## Configuration
Before running the script, ensure the following parameters are correctly set:
1. **Directories**: Provide the paths for sound files and TextGrid files, ending with a `/`.
2. **File Extensions**: Specify the extensions of the sound files (e.g., `.wav`) and TextGrid files (e.g., `.TextGrid`).
3. **Results File**: Set the full path where the output file will be saved.
4. **Tier**: Indicate the tier number to analyze.
5. **Pitch Range**: Define the minimum and maximum pitch in Hz.


## Output
The results file contains the following columns:
1. **Filename**: Name of the sound file.
2. **TextGridLabel**: Label of the interval.
3. **MeanPitch_Hz**: Mean pitch in Hz for the labeled interval (`--undefined--` if no pitch is detected).

## Usage
1. Place the script and all required files in the same directory or adjust paths as needed.
2. Run the script in Praat.
3. Check the results in the specified output file.

## Notes
- The script overwrites the results file if it already exists.
- Ensure all file paths and extensions are correct to avoid errors.
- The pitch range should be chosen based on the expected pitch of the speaker.

## Troubleshooting
- If the script fails to find files, check directory paths and file extensions.
- Ensure that Praat has permission to read and write to the specified directories.
- For undefined pitch values, check if the interval is too short or falls outside the pitch range.

## License
This script is distributed under the GNU General Public License. Feel free to modify and share it under the same terms.

---
For any questions or suggestions, contact Wellington Mendes at wellington.mendes@ufu.br


