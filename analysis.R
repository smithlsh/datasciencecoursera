#
# This function is used to translate the numeric label of one of the six
# activities to a descriptive labelof thr activitryt. 
#

translate<-function(xIn){
  switch(xIn,
        "1"="Walking",
        "2"="Walking_Upstairs",
        "3"="Walking_Downstairs",
        "4"="Sitting",
        "5"="Standing",
        "6"="Laying")
        
}

#
# This function is used to extract the data described in the code book from
# X text files.
#
CreateTableChunk<-function(dir,X.txt,subject.txt,y.txt,numLines=100,numLinesSkip=0){
        means<-read.table(X.txt,nrows=numLines,as.is=TRUE)
        Mean_X_Accl_of_Body<-means[,1]
        Mean_Y_Accl_of_Body<-means[,2]
        Mean_Z_Accl_of_Body<-means[,3]
        Mean_X_Grav_Accl<-means[,41]
        Mean_Y_Grav_Accl<-means[,42]
        Mean_Z_Grav_Accl<-means[,43]
        Mean_X_Jerk_of_Body<-means[,81]
        Mean_Y_Jerk_of_Body<-means[,82]
        Mean_Z_Jerk_of_Body<-means[,83]
        Mean_X_Angular_Velocity<-means[,121]
        Mean_Y_Angular_Velocity<-means[,122]
        Mean_Z_Angular_Velocity<-means[,123]
        subjects<-read.table(subject.txt,nrows=numLines,as.is=TRUE)
        Subjects<-subjects[,1]
        numADL<-read.table(y.txt,nrows=numLines,as.is=TRUE)
        Activities_of_Daily_Living<-sapply(numADL[,1],switch,"1"="Walking",
        "2"="Walking_Upstairs","3"="Walking_Downstairs","4"="Sitting",
        "5"="Standing","6"="Laying")
        dF<-data.frame(Subjects,Activities_of_Daily_Living,
        Mean_X_Accl_of_Body, Mean_Y_Accl_of_Body,
        Mean_Z_Accl_of_Body, Mean_X_Grav_Accl,
        Mean_Y_Grav_Accl,Mean_Z_Grav_Accl,Mean_X_Jerk_of_Body,
        Mean_Y_Jerk_of_Body,Mean_Z_Jerk_of_Body,
        Mean_X_Angular_Velocity, Mean_Y_Angular_Velocity,
        Mean_Z_Angular_Velocity,stringsAsFactors=FALSE) 
}

#
# This is the main routine that constructs the "tidy data table. Becasue of 
# limitations of my laptop, I had to read the data in chunks and create the
# tidy data in chunks.
#
Run<-function(){
	dir<-paste(getwd(),"test",sep="/")
	X.txt<-paste(dir,"/X_test.txt",sep="")
	y.txt<-	paste(dir,"/y_test.txt",sep="")
	subject.txt<-paste(dir,"/subject_test.txt",sep="")
        numLines<-2947
	numChunks<-as.integer(numLines/500)
	numLinesLeft<-numLines%%500
	dF_Test<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLines)
        sink("TidyDataTable",append=TRUE)
        print(dF_Test)
	for (i in (2:numChunks)){
		numLinesSkip=(i-1)*numChunks*numLines
       		 dF_Temp<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLines,numLinesSkip)
       		 dF_Test<-rbind(dF_Test,dF_Temp)
                 print(dF_Test)
	}
	numLinesSkip=numChunks*numLines
	dF_Last<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLinesLeft,numLinesSkip)
	dF_Test<-rbind(dF_Test,dF_Last)


	dir<-paste(getwd(),"train",sep="/")
	X.txt<-paste(dir,"/X_train.txt",sep="")
	y.txt<-paste(dir,"/y_train.txt",sep="")
	subject.txt<-paste(dir,"/subject_train.txt",sep="")
	numLines<-7352
	numChunks<-as.integer(numLines/500)
	numLinesLeft<-numLines%%500
	dF_Train<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLines)
	for (i in (2:numChunks)){
       		numLinesSkip=(i-1)*numChunks*numLines
        	dF_Temp<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLines,numLinesSkip)
        	dF_Train<-rbind(dF_Train,dF_Temp)
	}
 	numLinesSkip=numChunks*numLines
	dF_Last<-CreateTableChunk(dir,X.txt,subject.txt,y.txt,numLinesLeft,numLinesSkip)
	dF_Train<-rbind(dF_Train,dF_Last)
	dF<-rbind(dF_Train,dF_Test)
        dF2<-dF[order(dF$Subjects),]
#write.table(dF,"TidyDataTable")
        print(dF2) 
        
}

