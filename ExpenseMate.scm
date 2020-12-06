jadeVersionNumber "20.0.01";
schemaDefinition
ExpenseMate subschemaOf RootSchema completeDefinition, patchVersioningEnabled = false;
	documentationText
`Each User has zero or more Account
Each Account has one or more owning Users
Each Account can have zero or more ReoccurringExpenses assigned to it
Each Account can have zero or more ReoccurringDeposits assigned to it
Each ReoccurringDeposit has one owner
Each ReoccurringDeposit can have one or more ReoccurringExpenses assigned to it`
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
importedPackageDefinitions
constantDefinitions
localeDefinitions
	2057 "English (United Kingdom)" schemaDefaultLocale;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.294;
	5129 "English (New Zealand)" _cloneOf 2057;
		setModifiedTimeStamp "<unknown>" "" 2020:11:30:23:19:26;
libraryDefinitions
typeHeaders
	ExpenseMate subclassOf RootSchemaApp transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, highestOrdinal = 1, number = 2048;
	Data subclassOf Object number = 2051;
	Account subclassOf Data highestSubId = 1, highestOrdinal = 2, number = 2052;
	ReoccurringEvent subclassOf Data abstract, highestOrdinal = 5, number = 2058;
	ReoccurringDeposit subclassOf ReoccurringEvent highestSubId = 1, highestOrdinal = 2, number = 2113;
	ReoccurringExpense subclassOf ReoccurringEvent highestOrdinal = 4, number = 2114;
	Transaction subclassOf Data number = 2062;
	User subclassOf Data highestSubId = 1, highestOrdinal = 4, number = 2053;
	GExpenseMate subclassOf RootSchemaGlobal transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, highestOrdinal = 1, number = 2049;
	TemporalAdjuster subclassOf Object abstract, highestOrdinal = 1, number = 2050;
	RepeatingOccurrenceAdjuster subclassOf TemporalAdjuster highestOrdinal = 4, number = 2063;
	SExpenseMate subclassOf RootSchemaSession transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2065;
	AccountSet subclassOf ObjectSet loadFactor = 66, number = 2057;
	EventSet subclassOf ObjectSet loadFactor = 66, number = 2067;
	ExpenseSet subclassOf EventSet loadFactor = 66, number = 2069;
	UserSet subclassOf ObjectSet loadFactor = 66, number = 2059;
 
interfaceDefs
	TemporalAdjusterIF number = 1281
	(
	documentationText
`Have a TemporalAdjuster class for each type of adjustment

e.g. 

 - Next DayOfWeek Occurrence
 - Next day in month occurrence`

		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:11:48.607;
 
	jadeMethodDefinitions
		adjustInto(date: Date): Date number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:24:00:59:46.543;
	)
 
membershipDefinitions
	AccountSet of Account ;
	EventSet of ReoccurringEvent ;
	ExpenseSet of ReoccurringExpense ;
	UserSet of User ;
 
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
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:03:21:59:05.911;
	)
	Data completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:27:58.368;
	)
	Account completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:28:13.517;
	attributeDefinitions
		id:                            Integer protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:16:18.390;
	referenceDefinitions
		owners:                        UserSet   explicitInverse, protected, subId = 1, number = 2, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:54:57.208;
	)
	ReoccurringEvent completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:23:03:22.546;
	attributeDefinitions
		startDate:                     Date protected, number = 2, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:20:47:01.432;
	referenceDefinitions
		temporalAdjuster:              TemporalAdjuster   explicitEmbeddedInverse, protected, number = 1, ordinal = 5;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:18:03.680;
 
	jadeMethodDefinitions
		create(startDate: Date) updating, number = 1001;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:12:30.849;
		nextOccurrence(): Date number = 1003;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:28:19.219;
		nextOccurrenceFrom(fromDate: Date): Date number = 1002;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:28:15.104;
	)
	ReoccurringDeposit completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:44:31.327;
	referenceDefinitions
		expenses:                      ExpenseSet   explicitInverse, protected, subId = 1, number = 1, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:44:20.362;
 
	jadeMethodDefinitions
		addExpense(expense: ReoccurringExpense) updating, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:00:55.476;
		create(
			startDate: Date; 
			unit: Integer; 
			period: Integer) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:18:44.214;
		delete() updating, number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:06:04.838;
		reportNextOccurrence() number = 1003;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:22:32.265;
	)
	ReoccurringExpense completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:17:42.607;
	attributeDefinitions
		cost:                          Decimal[12] readonly, number = 3, ordinal = 3;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:03:35.193;
		name:                          String[101] readonly, number = 2, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:03:24.672;
	referenceDefinitions
		deposit:                       ReoccurringDeposit   explicitEmbeddedInverse, protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:44:20.364;
 
	jadeMethodDefinitions
		create(
			startDate: Date; 
			name: String; 
			unit: Integer; 
			period: Integer; 
			cost: Decimal) updating, number = 1001;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:18:21.193;
	)
	Transaction completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:28:54.269;
	)
	User completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:23:03:47.291;
	attributeDefinitions
		firstName:                     String[31] protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:44:48.318;
		lastName:                      String[31] protected, number = 2, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:44:55.816;
		name:                          String[62] readonly, virtual, number = 3, ordinal = 3;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:45:13.016;
	referenceDefinitions
		accounts:                      AccountSet   explicitInverse, protected, subId = 1, number = 4, ordinal = 4;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:54:57.204;
 
	jadeMethodDefinitions
		addAccount(account: Account) number = 1003;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:23:05:18.889;
		create(
			firstName: String; 
			lastName: String) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:46:44.124;
		name(
			set: Boolean; 
			_value: String io) mapping, number = 1001;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:23:05:28.991;
	)
	Global completeDefinition
	(
	)
	RootSchemaGlobal completeDefinition
	(
	)
	GExpenseMate completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:03:21:59:00.928;
	)
	JadeScript completeDefinition
	(
 
	jadeMethodDefinitions
		monthyDepositExample() number = 1001;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:48:57.349;
	)
	JadeTestCase completeDefinition
	(
		setModifiedTimeStamp "cnwnhs1" "99.0.00" 31016 2017:08:01:15:34:51.891;
	)
	TemporalAdjuster completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:29:25.194;
	referenceDefinitions
		owningEvent:                   ReoccurringEvent   explicitEmbeddedInverse, protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:18:03.696;
 
	jadeMethodDefinitions
		adjustInto(date: Date): Date abstract, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:29:33.261;
	implementInterfaces
		TemporalAdjusterIF
		(
		adjustInto is adjustInto;
		)
	)
	RepeatingOccurrenceAdjuster completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:21:06:38.152;
	constantDefinitions
		Daily:                         Integer = 0 number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:49:41.341;
		Monthly:                       Integer = 2 number = 1003;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:49:55.312;
		Weekly:                        Integer = 1 number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:49:47.239;
		Yearly:                        Integer = 3 number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:50:05.405;
	attributeDefinitions
		period:                        Integer protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:31:12.711;
		startDate:                     Date protected, number = 3, ordinal = 3;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:54:24.918;
		unit:                          Integer protected, number = 2, ordinal = 2;
	documentationText
`Based on RepeatingOccurrenceAdjuster constants
 - Daily
 - Weekly
 - Monthly
 - Yearly`

		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:59:21.057;
	referenceDefinitions
		event:                         ReoccurringExpense  protected, number = 4, ordinal = 4;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:13:08.638;
 
	jadeMethodDefinitions
		adjustInto(date: Date): Date number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:22:00:52.074;
		create(
			startDate: Date; 
			unit: Integer; 
			period: Integer) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:22:58:18.021;
		createAdjuster(
			startDate: Date; 
			unit: Integer; 
			period: Integer): RepeatingOccurrenceAdjuster typeMethod, number = 1007;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:01:00:24:24.842;
		nextDailyValue(date: Date): Date number = 1005;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:22:37:00.013;
		nextMonthlyValue(date: Date): Date number = 1003;
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:11:22:23:05:25.553;
		nextWeeklyValue(date: Date): Date number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:22:32:48.750;
		nextYearlyValue(date: Date): Date number = 1006;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:27:21:57:57.013;
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
	Collection completeDefinition
	(
	)
	Btree completeDefinition
	(
	)
	Set completeDefinition
	(
	)
	ObjectSet completeDefinition
	(
	)
	AccountSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:53:49.457;
	)
	EventSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:20:55:08.250;
	)
	ExpenseSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:04:18.325;
	)
	UserSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "20.0.01" 2020:12:05:22:54:10.202;
	)
	Date completeDefinition
	(
 
	jadeMethodDefinitions
		createDate(
			day: Integer; 
			month: Integer; 
			year: Integer): Date typeMethod, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:22:50:08.408;
		with(adjuster: TemporalAdjusterIF): Date number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:13:03.143;
	)
 
 
inverseDefinitions
	accounts of User manual peerOf owners of Account automatic;
	temporalAdjuster of ReoccurringEvent parentOf owningEvent of TemporalAdjuster;
	deposit of ReoccurringExpense peerOf expenses of ReoccurringDeposit;
databaseDefinitions
ExpenseMateDb
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	databaseFileDefinitions
		"expensemate" number = 51;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	defaultFileDefinition "expensemate";
	classMapDefinitions
		SExpenseMate in "_environ";
		ExpenseMate in "_usergui";
		GExpenseMate in "expensemate";
		Data in "expensemate";
		Account in "expensemate";
		User in "expensemate";
		ReoccurringEvent in "expensemate";
		Transaction in "expensemate";
		ReoccurringDeposit in "expensemate";
		ReoccurringExpense in "expensemate";
		EventSet in "expensemate";
		ExpenseSet in "expensemate";
		TemporalAdjuster in "expensemate";
		RepeatingOccurrenceAdjuster in "expensemate";
		AccountSet in "expensemate";
		UserSet in "expensemate";
	)
schemaViewDefinitions
exportedPackageDefinitions
typeSources
	ReoccurringEvent (
	jadeMethodSources
create
{
create(startDate: Date) updating;

begin
	self.startDate := startDate;
end;

}

nextOccurrence
{
nextOccurrence(): Date;

begin
	return self.nextOccurrenceFrom(app.getUTCTime.date);
end;

}

nextOccurrenceFrom
{
nextOccurrenceFrom(fromDate: Date): Date;

begin
	return fromDate.with(self.temporalAdjuster);
end;

}

	)
	ReoccurringDeposit (
	jadeMethodSources
addExpense
{
addExpense(expense: ReoccurringExpense) updating;

begin
	expenses.add(expense);
end;

}

create
{
create(startDate: Date; unit: Integer; period: Integer)::super(startDate) updating;

begin
	self.temporalAdjuster := RepeatingOccurrenceAdjuster@createAdjuster(startDate, unit, period);
end;

}

delete
{
delete() updating;

vars

begin
	expenses.purge;
end;

}

reportNextOccurrence
{
reportNextOccurrence();

vars
	expense: ReoccurringExpense;
	date, nextDeposit, followingDeposit: Date;
	totalExpenses: Decimal[12,2];
begin
	nextDeposit := self.nextOccurrence();
	followingDeposit := self.nextOccurrenceFrom(nextDeposit);
	
	write "Next deposit - " & nextDeposit.display() & " (period ends " & followingDeposit.display() & ") covers the following expenses:";
	
	foreach expense in self.expenses do
		date := expense.nextOccurrenceFrom(nextDeposit);
		
		if date < followingDeposit then
			write CrLf & expense.name & " expenses:";
		endif;
		
		while date < followingDeposit do
			write Tab & " - " & date.display() & " - $" & expense.cost.display();
			totalExpenses := totalExpenses + expense.cost;
			date := expense.nextOccurrenceFrom(date);
		endwhile;
	endforeach;
	
	write CrLf & " Total expenses: $" & totalExpenses.display();
end;

}

	)
	ReoccurringExpense (
	jadeMethodSources
create
{
create(startDate: Date; name: String; unit: Integer; period: Integer; cost: Decimal)::super(startDate) updating;

begin
	self.name := name;
	self.cost := cost;
	self.temporalAdjuster := RepeatingOccurrenceAdjuster@createAdjuster(startDate, unit, period);
end;

}

	)
	User (
	jadeMethodSources
addAccount
{
addAccount(account: Account);

begin
	accounts.tryAdd(account);
end;

}

create
{
create(firstName, lastName: String) updating;

begin
	self.firstName := firstName;
	self.lastName := lastName;
end;

}

name
{
name(set: Boolean; _value: String io) mapping;

begin
	if not set then
		_value := firstName & " " & lastName;
	endif;
end;

}

	)
	JadeScript (
	jadeMethodSources
monthyDepositExample
{
monthyDepositExample();

vars
	date: Date;
	expense: ReoccurringExpense;
	monthlyDeposit: ReoccurringDeposit;
begin
	date := Date@createDate(22,10,2020);
	monthlyDeposit := create ReoccurringDeposit(date, RepeatingOccurrenceAdjuster.Monthly, 1) transient;
	
	date := Date@createDate(27,10,2020);
	expense := create ReoccurringExpense(date, "Rent", RepeatingOccurrenceAdjuster.Weekly, 1, 200.00) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(24,10,2020);
	expense := create ReoccurringExpense(date, "Grocceries", RepeatingOccurrenceAdjuster.Weekly, 1, 100.00) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(12,11,2020);
	expense := create ReoccurringExpense(date, "Internet", RepeatingOccurrenceAdjuster.Monthly, 1, 74.95) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(13,11,2020);
	expense := create ReoccurringExpense(date, "Power", RepeatingOccurrenceAdjuster.Monthly, 1, 80.00) transient;
	monthlyDeposit.addExpense(expense);
		
	monthlyDeposit.reportNextOccurrence();
epilog
	delete monthlyDeposit;
end;

}

	)
	TemporalAdjuster (
	jadeMethodSources
adjustInto
{
adjustInto(date : Date) : Date abstract;

}

	)
	RepeatingOccurrenceAdjuster (
	jadeMethodSources
adjustInto
{
adjustInto(date: Date): Date;

vars
	adjustedDate	: Date;
	startModulus	: Integer;
	adjustedModulus	: Integer;
begin
	
	if date < self.startDate then
		return self.startDate;
	endif;

	if self.unit = Daily then
	
		return nextDailyValue(date);
	
	elseif self.unit = Weekly then
	
		return nextWeeklyValue(date);
		
	elseif self.unit = Monthly then
	
		return nextMonthlyValue(date);
	
	elseif self.unit = Yearly then
	
		return nextYearlyValue(date);
	
	endif;
	
	return null;
end;

}

create
{
create(startDate: Date; unit, period: Integer) updating;

begin
	self.startDate := startDate;
	self.unit := unit;
	self.period := period;
end;

}

createAdjuster
{
createAdjuster(startDate: Date; unit, period: Integer): RepeatingOccurrenceAdjuster typeMethod;

vars
	adjuster: RepeatingOccurrenceAdjuster;
begin
	adjuster := create RepeatingOccurrenceAdjuster(startDate, unit, period) transient;
	return adjuster;
end;

}

nextDailyValue
{
nextDailyValue(date: Date): Date;

vars
	totalDays		: Integer;
	modulus			: Integer;
	diff			: Integer;
	adjustedDate	: Date;
begin

	totalDays := date.Integer - self.startDate.Integer;
	modulus := totalDays mod self.period;
	diff := self.period - modulus;
	adjustedDate := (date.Integer + diff).Date;
	
	return adjustedDate;
end;


}

nextMonthlyValue
{
nextMonthlyValue(date: Date): Date;

	// Example
	// Period		: 5 Months
	// StartDate 	: 9 October 1994
	// Date			: 5 March 1998
	// TotalMonths 	: ((1998 - 1994) * 12) + (3 - 10) = 48 - 7 = 41 

vars
	totalMonths		: Integer;
	modulus			: Integer;
	diff			: Integer;
	adjustedDate	: Date;
begin

	totalMonths := ((date.year - self.startDate.year) * 12) + (date.month - self.startDate.month);
	
	modulus := totalMonths mod self.period;
	diff := self.period - modulus;
	
	if date.day < self.startDate.day and modulus = null then
		diff := diff - self.period;
	endif;
	
	if date.month + diff > 12 then
		diff := diff - (12 - date.month);
		adjustedDate.setDate(self.startDate.day, diff, date.year + 1);
	else
		adjustedDate.setDate(self.startDate.day, date.month + diff, date.year);
	endif;
	
	return adjustedDate;
end;

}

nextWeeklyValue
{
nextWeeklyValue(date: Date): Date;

vars
	totalDays		: Integer;
	modulus			: Integer;
	diff			: Integer;
	adjustedDate	: Date;
begin

	totalDays := date.Integer - self.startDate.Integer;
	modulus := totalDays mod (7 * period);
	diff := (7 * period) - modulus;
	adjustedDate := (date.Integer + diff).Date;
	
	return adjustedDate;
end;

}

nextYearlyValue
{
nextYearlyValue(date: Date): Date;

vars
	totalYears		: Integer;
	modulus			: Integer;
	diff			: Integer;
	adjustedDate	: Date;
begin

	totalYears := self.startDate.year - date.year;
	modulus := totalYears mod self.period;
	diff := self.period - modulus;
	
	if date.month < self.startDate.month then
		adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + diff);
	elseif date.month = self.startDate.month then
		if date.day < self.startDate.day then
			adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + diff);
		else
			adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + diff + 1);
		endif;
	else
		adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + diff + 1);
	endif;
	
	return adjustedDate;
end;

}

	)
	Date (
	jadeMethodSources
createDate
{
createDate(day: Integer; month: Integer; year: Integer): Date typeMethod;

vars
	date: Date;
begin
	date.setDate(day, month, year);
	return date;
end;

}

with
{
with(adjuster: TemporalAdjusterIF): Date;

begin
	return adjuster.adjustInto(self);
end;

}

	)
	TemporalAdjusterIF (
	jadeMethodSources
adjustInto
{
adjustInto(date: Date): Date;
}

	)
