float Average( int data_count, float Data[data_count] )
{
	float sum = 0.0;
	float average = 0.0;

	for( int idx = 0; idx < data_count; idx++ )
	{
		sum = sum + Data[idx];
	}
	
	average = sum / data_count;

	return average;
}
