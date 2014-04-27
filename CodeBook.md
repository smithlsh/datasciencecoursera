I.	Introduction
Remote patient sensing is a way for allowing disabled and elderly patients
health and well-being monitoring as they perform activities throughout
the day.  The paper by Anguita et al
(see: https://www.dropbox.com/s/x73lss0fe1monnu/2013%20-%20JUCS%20-%20Energy%20Efficient%20Smartphone-Based%20Activity%20Recognition%20using%20Fixed-Point%20Arithmetic.pdf)
investigates the use of cell phones to do this monitoring.  In
this project we present a summary of their data which they had spread over multiple files.

II.           Description of Summary Data Extracted        

The authors focused on six basic activities – walking, walking upstairs,
walking downstairs, sitting , standing and laying – listed
in the activities_labels.txt file.  The authors studied 30 subject,
broken into testing and training groups.  For each group, the individual
subjects, each represented by an integer between 1 and 30, were read
from the subject text files (subject_test.txt and subject_train.txt).
The activity performed by that subject was read from the y text
files (y_test.txt and y_train.txt).  These activities were labeled
by an integer between 1 and 6 and were converted into a specific
activity according to the activity_labels.txt file.  The mean
linear accelerations about the x, y, and z axes (tri-axial accelerations) and
gyroscopic or angular velocities about the the x, y and z axes
 (also tri-axial!) arising from the both the static gravitational force
and dynamic bodily forces  were extracted from the X text files
(X_test.txt and X_train.txt).   In addition we also extracted the jerking
motion, corresponding to the time derivatives of the bodily motion which
also was in the X text files. The data in these X text files are arranged
in columns.  The labels corresponding to these columns are in the
features.txt file and the specific columns we were interested in are:
tBodyAcc-mean()-X (Description: Mean acceleration of body in the X direction from column 1)
tBodyAcc-mean()-Y (Description: Mean acceleration of body in the Y direction from column 2)
tBodyAcc-mean()-Z (Description: Mean acceleration of body in the Z direction from column 3)
tGravityAcc-mean()-X (Description: Mean acceleration from gravity in the X direction from column 41)
tGravityAcc-mean()-Y (Description: Mean acceleration from gravity in the Y direction from column 42)
tGravityAcc-mean()-Z (Description: Mean acceleration from gravity in the Z direction from column 43)
tBodyAccJerk-mean()-X (Description:Mean Jerk of Body in the X direction from column 81)
tBodyAccJerk-mean()-Y (Description:Mean Jerk of Body in the Y direction from column 82)
tBodyAccJerk-mean()-Z (Description:Mean Jerk of Body in the Z direction from column 83)
tBodyGyro-mean()-X  (Description: Mean Gyroscopic velocity about the X axis from column 121)
tBodyGyro-mean()-Y  (Description: Mean Gyroscopic velocity about the Y axis from column 121)
tBodyGyro-mean()-Z  (Description: Mean Gyroscopic velocity about the Z axis from column 121)

The units of the accelerations are in units of the gravitational
constant g and the angular velocities are in radians/sec.
Data was collected at a uniform frequency of  50 Hz. 

