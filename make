SOURCE_PATH=$1
CLASS_PATH=$2
BUILD_PATH=$3
BUILD_OPTIONS=${*:4}

LIST=`find $SOURCE_PATH -name "*.java"`
CLASS_LIST=''

if [ ! -d $BUILD_PATH ]
	then
		mkdir -p $BUILD_PATH
fi

if [ ! -d $CLASS_PATH ]
	then
		mkdir -p $CLASS_PATH
fi

for file in `find $CLASS_PATH -name "*.jar"`; do
	CLASS_LIST=$file:$CLASS_LIST
done

if [ "$CLASS_LIST" = "" ]
	then
		javac -d $BUILD_PATH $BUILD_OPTIONS $LIST
	else
		javac -cp $CLASS_LIST -d $BUILD_PATH $BUILD_OPTIONS $LIST
fi

if [ $? -ne 0 ]
then
    echo "Build Fail"
else
    echo "Build Complete"
fi
