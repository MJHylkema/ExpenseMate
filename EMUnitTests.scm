jadeVersionNumber "18.0.01";
schemaDefinition
EMUnitTests subschemaOf ExpenseMate completeDefinition, patchVersioningEnabled = false;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.846;
importedPackageDefinitions
constantDefinitions
localeDefinitions
	5129 "English (New Zealand)" schemaDefaultLocale;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:56:44.808;
libraryDefinitions
typeHeaders
	EMUnitTests subclassOf ExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2061;
	GEMUnitTests subclassOf GExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2064;
	AdjustersTestSuite subclassOf JadeTestCase number = 2070;
	SEMUnitTests subclassOf SExpenseMate transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2066;
 
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
		repeatingOccurrence_daily() unitTest, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:22:57:10.510;
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
repeatingOccurrence_daily
{
repeatingOccurrence_daily() unitTest;

vars
	adjuster: RepeatingOccurrenceAdjuster;
	startDate: Date;
begin
	startDate := Date@createDate(9,10,1994);
	adjuster := create RepeatingOccurrenceAdjuster(startDate, RepeatingOccurrenceAdjuster.Daily, 1) transient;

	// Regular case
	assertEquals(Date@createDate(5,2,2000), Date@createDate(4,2,2000).with(adjuster));
	
	// End of month case
	assertEquals(Date@createDate(1,2,2000), Date@createDate(31,1,2000).with(adjuster));
	
	// End of year case
	assertEquals(Date@createDate(1,1,2000), Date@createDate(31,12,1999).with(adjuster));
	
epilog
	delete adjuster;
end;

}

	)
