#include "Include/include.h"
#include "Include/type.h"
#include "Include/message.h"
#include "Include/proto.h"

int main( int argc, char **argv )
{
	int data_count = argc - 1;

	if( argc == 1 )
	{
		fprintf( stderr, _ERROR_NO_ARGS_PASSED );
		return( -1 );
	}

	float *Data = (float *) malloc( data_count * sizeof( float ) );

	if( !Data )
	{
		fprintf( stderr, _ERROR_ALLOCATION );
		return( -2 );
	}

	printf("%s\n", "Copying argv into array");
	for( int idx = 0; idx < argc - 1; idx++)
	{
		float tmp = atof( argv[idx + 1] );
		Data[idx] = tmp;
	}

	float average = 0.0;
	float std_dev = 0.0;

	printf("%s\n", "Calculating average");
	average = Average( data_count, Data[data_count] );

	printf("%s\n", "Calculuating std-deviation");
	std_dev = std_Dev( data_count, Data[data_count], average );

	printf("Average == %f; Std-Deviation == %f", average, std_dev, "\n");

	return 0;
}
