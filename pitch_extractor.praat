# This script was created by Wellington Mendes and Guilherme Felisbino (UFU, 2025).
# It opens each TextGrid file in a directory, loads the matching sound file,
# and extracts the mean pitch for labeled intervals. The results are written to a
# tab-delimited text file. It is a modified version of "duration_multiple.praat" by
# Mietta Lennes (http://www.helsinki.fi/~lennes/praat-scripts/), with further
# modifications by Maria Cantoni (UFMG, 2016). This script is distributed under the
# GNU General Public License.

form Get pitch mean from labeled segments in files
    comment Directory of sound files. Be sure to include the final "/"
    text sound_directory D:/Praat/
    sentence sound_file_extension .wav
    comment Directory of TextGrid files. Be sure to include the final "/"
    text textGrid_directory D:/Praat/
    sentence textGrid_file_extension .TextGrid
    comment Full path of the resulting text file:
    text resultsfile D:/Praat/results_pitch.txt
    comment Which tier do you want to analyze?
    integer tier 1
    positive minimum_pitch 75
    positive maximum_pitch 300
endform

# Create a list of TextGrid files in the directory
Create Strings as file list... list 'textGrid_directory$'*'textGrid_file_extension$'
numberOfFiles = Get number of strings

# Check if the results file exists
if fileReadable (resultsfile$)
    pause The file 'resultsfile$' already exists! Do you want to overwrite it?
    filedelete 'resultsfile$'
endif

# Write the header row
header$ = "Filename" + tab$ + "TextGridLabel" + tab$ + "MeanPitch_Hz" + newline$
fileappend "'resultsfile$'" 'header$'

# Process each TextGrid file
for ifile to numberOfFiles
    filename$ = Get string... ifile
    Read from file... 'textGrid_directory$''filename$'

    # Extract the sound file name
    soundname$ = selected$ ("TextGrid", 1)
    soundfile$ = sound_directory$ + soundname$ + sound_file_extension$

    # Check if the corresponding sound file exists
    if fileReadable (soundfile$)
        Read from file... 'soundfile$'
        select Sound 'soundname$'

        # Extract pitch
        To Pitch... 0.01 minimum_pitch maximum_pitch
        select Pitch 'soundname$'

        # Process TextGrid intervals
        select TextGrid 'soundname$'
        numberOfIntervals = Get number of intervals... tier

        for interval to numberOfIntervals
            label$ = Get label of interval... tier interval
            if label$ <> ""
                start = Get starting point... tier interval
                end = Get end point... tier interval

                # Extract mean pitch for the interval
                select Pitch 'soundname$'
                meanPitch = Get mean... start end Hertz
                if meanPitch = undefined
                    meanPitch$ = "--undefined--"
                else
                    meanPitch$ = string$(meanPitch)
                endif

                # Write results to file
                resultline$ = "'soundname$'" + tab$ + "'label$'" + tab$ + "'meanPitch$'" + newline$
                fileappend "'resultsfile$'" 'resultline$'

                # Re-select TextGrid for the next interval
                select TextGrid 'soundname$'
            endif
        endfor

        # Clean up
        select TextGrid 'soundname$'
        plus Pitch 'soundname$'
        Remove
        select Sound 'soundname$'
        Remove
    endif

    select Strings list
endfor

# Remove the list of TextGrid files
Remove
