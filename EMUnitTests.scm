jadeVersionNumber "18.0.01";
schemaDefinition
EMUnitTests subschemaOf ExpenseMate completeDefinition, patchVersioningEnabled = false;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.846;
importedPackageDefinitions
constantDefinitions
localeDefinitions
	5129 "English (New Zealand)" schemaDefaultLocale;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.808;
	2057 "English (United Kingdom)" _cloneOf 5129;
		setModifiedTimeStamp "<unknown>" "" 2020:10:27:20:41:24;
libraryDefinitions
typeHeaders
	EMUnitTests subclassOf ExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2070;
	GEMUnitTests subclassOf GExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2071;
	AdjustersTestSuite subclassOf JadeTestCase number = 2072;
	SEMUnitTests subclassOf SExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2073;
 
interfaceDefs
membershipDefinitions
 
typeDefinitions
	Object completeDefinition
	(
	)
	Application completeDefinition
	(
	)
	RootSchemaApp completeDefinition
	(
	)
	ExpenseMate completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.310;
	)
	EMUnitTests completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.845;
	)
	Global completeDefinition
	(
	)
	RootSchemaGlobal completeDefinition
	(
	)
	GExpenseMate completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	)
	GEMUnitTests completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.845;
	)
	JadeTestCase completeDefinition
	(
		setModifiedTimeStamp "cnwnhs1" "99.0.00" 31016 2017:08:01:15:34:51.891;
	)
	AdjustersTestSuite completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:22:40:12.242;
 
	jadeMethodDefinitions
		repeatingOccurrence_daily_1() unitTest, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:22:36:05.220;
		repeatingOccurrence_daily_5() unitTest, number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:23:24:52.964;
		repeatingOccurrence_monthly_1() unitTest, number = 1005;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:11:13:01:48:39.189;
		repeatingOccurrence_monthly_3() unitTest, number = 1006;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:23:51:37.901;
		repeatingOccurrence_weekly_1() unitTest, number = 1003;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:23:25:50.416;
		repeatingOccurrence_weekly_5() unitTest, number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:23:28:58.036;
	)
	WebSession completeDefinition
	(
	)
	RootSchemaSession completeDefinition
	(
		setModifiedTimeStamp "<unknown>" "6.1.00" 20031119 2003:12:01:13:54:02.270;
	)
	SExpenseMate completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	)
	SEMUnitTests completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.846;
	)
 
inverseDefinitions
databaseDefinitions
EMUnitTestsDb
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.846;
	databaseFileDefinitions
		"emunittests" number=52;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.846;
	defaultFileDefinition "emunittests";
	classMapDefinitions
		SEMUnitTests in "_environ";
		EMUnitTests in "_usergui";
		GEMUnitTests in "emunittests";
		AdjustersTestSuite in "emunittests";
	)
schemaViewDefinitions
exportedPackageDefinitions
typeSources
	AdjustersTestSuite (
	jadeMethodSources
repeatingOccurrence_daily_1
{
repeatingOccurrence_daily_1() unitTest;

vars
	startDate: Date;
	adjuster: RepeatingOccurrenceAdjuster;
begin
	startDate.setDate(9,10,1994);
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Daily, 1) transient;

	// Regular case
	assertEquals(Date@createDate(5,2,2000), Date@createDate(4,2,2000).with(adjuster));
	
	// End of month case
	assertEquals(Date@createDate(1,2,2000), Date@createDate(31,1,2000).with(adjuster));
	
	// End of year case
	assertEquals(Date@createDate(1,1,2000), Date@createDate(31,12,1999).with(adjuster));
	
	// Same date case
	assertEquals(Date@createDate(10,10,1994), Date@createDate(9,10,1994).with(adjuster));
	
	// Earlier date case
	assertEquals(startDate, Date@createDate(1,10,1994).with(adjuster));
	
epilog
	delete adjuster;
end;

}

repeatingOccurrence_daily_5
{
repeatingOccurrence_daily_5() unitTest;

vars
	startDate: Date;
	adjuster: RepeatingOccurrenceAdjuster;
begin
	startDate := 10000.Date;
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Daily, 5) transient;

	// Regular case
	assertEquals(10020.Date, 10018.Date.with(adjuster));
	
	// Periodic date case
	assertEquals(10105.Date, 10100.Date.with(adjuster));
	
	// Same date case
	assertEquals(10005.Date, 10000.Date.with(adjuster));
	
	// Earlier date case
	assertEquals(10000.Date, 9000.Date.with(adjuster));
	
epilog
	delete adjuster;
end;

}

repeatingOccurrence_monthly_1
{
repeatingOccurrence_monthly_1() unitTest;

vars
	startDate		: Date;
	adjuster		: RepeatingOccurrenceAdjuster;
	date			: Date;
	adjustedDate	: Date;
begin
	startDate.setDate(9,10,1994);
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Monthly, 1) transient;

	// Regular case - before day of month
	date.setDate(4,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,2,2000), adjustedDate);
	
	// Regular case - after day of month
	date.setDate(12,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,3,2000), adjustedDate);
	
	// Periodic date case
	date.setDate(9,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,3,2000), adjustedDate);
	
	// Same date case
	date.setDate(9,10,1994);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,11,1994), adjustedDate);
	
	// Earlier date case
	date.setDate(1,1,1990);	
	adjustedDate := date.with(adjuster);
	assertEquals(startDate, adjustedDate);
	
epilog
	delete adjuster;
end;

}

repeatingOccurrence_monthly_3
{
repeatingOccurrence_monthly_3() unitTest;

vars
	startDate		: Date;
	adjuster		: RepeatingOccurrenceAdjuster;
	date			: Date;
	adjustedDate	: Date;
begin
	startDate.setDate(9,10,1994);
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Monthly, 1) transient;

	// Regular case
	date.setDate(4,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,2,2000), adjustedDate);
	
	// Periodic date case
	date.setDate(9,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,3,2000), adjustedDate);
	
	// Same date case
	date.setDate(9,10,1994);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(9,11,1994), adjustedDate);
	
	// Earlier date case
	date.setDate(1,1,1990);	
	adjustedDate := date.with(adjuster);
	assertEquals(startDate, adjustedDate);
	
epilog
	delete adjuster;
end;

}

repeatingOccurrence_weekly_1
{
repeatingOccurrence_weekly_1() unitTest;

vars
	startDate		: Date;
	startDayOfWeek	: Integer;
	adjuster		: RepeatingOccurrenceAdjuster;
	date			: Date;
	adjustedDate	: Date;
begin
	startDate.setDate(9,10,1994);
	startDayOfWeek := startDate.dayOfWeek;
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Weekly, 1) transient;

	// Regular case
	date.setDate(4,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(6,2,2000), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Periodic date case
	date.setDate(6,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(13,2,2000), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Same date case
	date.setDate(9,10,1994);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(16,10,1994), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Earlier date case
	date.setDate(1,10,1994);	
	adjustedDate := date.with(adjuster);
	assertEquals(startDate, adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
epilog
	delete adjuster;
end;

}

repeatingOccurrence_weekly_5
{
repeatingOccurrence_weekly_5() unitTest;

vars
	startDate		: Date;
	startDayOfWeek	: Integer;
	adjuster		: RepeatingOccurrenceAdjuster;
	date			: Date;
	adjustedDate	: Date;
begin
	startDate.setDate(9,10,1994);
	startDayOfWeek := startDate.dayOfWeek;
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Weekly, 3) transient;
	
	// Regular case
	date.setDate(4,2,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(13,2,2000), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Periodic date case
	date.setDate(23,1,2000);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(13,2,2000), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Same date case
	date.setDate(9,10,1994);
	adjustedDate := date.with(adjuster);
	assertEquals(Date@createDate(30,10,1994), adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	// Earlier date case
	date.setDate(1,1,1990);	
	adjustedDate := date.with(adjuster);
	assertEquals(startDate, adjustedDate);
	assertEquals(startDayOfWeek, adjustedDate.dayOfWeek);
	
	
epilog
	delete adjuster;
end;

}

	)
