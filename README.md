README - GoPro2Prelude
==================================================================

GoPro2Prelude is a script to repackage GoPro recorded video clips
for use in Adobe Prelude and Adobe Premiere. It operates by
iterating over all video files in the script directory and all
sub-directories.


REQUIREMENTS
------------------------------------------------------------------

Script requires the path to an FFmbc installation.

FFmbc can be found at: https://code.google.com/p/ffmbc/


HOW TO RUN
------------------------------------------------------------------

1. Copy script into the root source directory.
2. Execute script
3. When script is finished, press any key to close the window

The result of a successful conversion will be a new directory in
the source folder containing a replication of the source directory
folder structure, populated with the converted video files
relative to each source file.


ADVANCED USE
------------------------------------------------------------------

The script can be configured by changing the variable values
located in the "Configure Script Here" section.

<table>
<tr align="left"><th width="100">Variable</th><th>Description</th></tr>
<tr><td>DEST</td>	<td>path of conversion directory</td></tr>
<tr><td>LOG_PATH</td>	<td>path to script log file</td></tr>
<tr><td>FFmbc</td>	<td>path to FFmbc installation</td></tr>
</table>