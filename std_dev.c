float std_Dev( int data_count, float Data[ data_count ], float average)
{
	float deviation = 0.0;
	float sum = 0.0;

	for( int idx = 0; idx < data_count; idx++)
	{
		sum += pow(Data[ data_count ] - average, 2);
	}
	deviation = sqrt(sum / data_count );

	return deviation;
}
