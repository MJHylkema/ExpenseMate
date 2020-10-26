jadeVersionNumber "18.0.01";
schemaDefinition
ExpenseMate subschemaOf RootSchema completeDefinition, patchVersioningEnabled = false;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
importedPackageDefinitions
constantDefinitions
localeDefinitions
	2057 "English (United Kingdom)" schemaDefaultLocale;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.294;
	5129 "English (New Zealand)" _cloneOf 2057;
		setModifiedTimeStamp "<unknown>" "" 2020:10:24:00:42:45;
libraryDefinitions
typeHeaders
	ExpenseMate subclassOf RootSchemaApp transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2048;
	Data subclassOf Object number = 2051;
	Account subclassOf Data highestOrdinal = 1, number = 2052;
	Event subclassOf Data highestOrdinal = 2, number = 2058;
	ReoccurringDeposit subclassOf Event highestSubId = 1, highestOrdinal = 2, number = 2113;
	ReoccurringExpense subclassOf Event highestOrdinal = 3, number = 2114;
	EventOccurrence subclassOf Data highestOrdinal = 2, number = 2115;
	Transaction subclassOf Data number = 2062;
	User subclassOf Data number = 2053;
	GExpenseMate subclassOf RootSchemaGlobal transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2049;
	TemporalAdjuster subclassOf Object abstract, number = 2055;
	RepeatingOccurrenceAdjuster subclassOf TemporalAdjuster highestOrdinal = 3, number = 2056;
	SExpenseMate subclassOf RootSchemaSession transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed, number = 2050;
	EventSet subclassOf ObjectSet loadFactor = 66, number = 2063;
	ExpenseSet subclassOf EventSet loadFactor = 66, number = 2065;
 
interfaceDefs
	TemporalAdjusterIF number = 1280
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
	EventSet of Event ;
	ExpenseSet of ReoccurringExpense ;
 
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
	)
	Event completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:58:13.932;
	attributeDefinitions
		startDate:                     Date protected, number = 2, ordinal = 2;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:20:47:01.432;
	referenceDefinitions
		occurrence:                    EventOccurrence  protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:56:48.002;
 
	jadeMethodDefinitions
		create(
			startDate: Date; 
			occurrence: EventOccurrence) updating, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:20:53:54.567;
		nextOccurrence(): Date number = 1003;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:14:36.228;
		nextOccurrenceFrom(fromDate: Date): Date number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:14:48.155;
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
			occurrence: EventOccurrence) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:27:58.757;
		delete() updating, number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:06:04.838;
		reportNextOccurrence() number = 1003;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:17:22.110;
	)
	ReoccurringExpense completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:11:17.485;
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
			name: String; 
			startDate: Date; 
			occurrence: EventOccurrence; 
			cost: Decimal) updating, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:17:41.304;
	)
	EventOccurrence completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:44:40.012;
	constantDefinitions
		Daily:                         Integer = 0 number = 1001;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:57:05.729;
		Monthly:                       Integer = 2 number = 1003;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:57:14.601;
		Weekly:                        Integer = 1 number = 1002;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:57:10.237;
		Yearly:                        Integer = 3 number = 1004;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:57:19.362;
	attributeDefinitions
		period:                        Integer protected, number = 2, ordinal = 2;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:54:53.880;
		timeUnit:                      Integer protected, number = 1, ordinal = 1;
		setModifiedTimeStamp "user" "18.0.01" 2020:10:20:23:53:40.742;
 
	jadeMethodDefinitions
		create(
			period: Integer; 
			unit: Integer) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:21:29.681;
		createOccurrence(
			period: Integer; 
			unit: Integer): EventOccurrence typeMethod, number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:23:35.900;
		nextOccurrence(
			startDate: Date; 
			fromDate: Date): Date number = 1003;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:21:52:23.999;
		reportOccurrence(): String number = 1004;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:02:41.711;
	)
	Transaction completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:28:54.269;
	)
	User completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:28:20.737;
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
	JadeScript completeDefinition
	(
 
	jadeMethodDefinitions
		monthyDepositExample() number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:44:47.868;
	)
	TemporalAdjuster completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:16:29:25.194;
 
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
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:17:33:43.901;
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
 
	jadeMethodDefinitions
		adjustInto(date: Date): Date number = 1001;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:17:34:28.250;
		create(
			startDate: Date; 
			unit: Integer; 
			period: Integer) updating, number = 1002;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:26:22:58:18.021;
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
	EventSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:20:55:08.250;
	)
	ExpenseSet completeDefinition
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:10:22:22:04:18.325;
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
	deposit of ReoccurringExpense peerOf expenses of ReoccurringDeposit;
databaseDefinitions
ExpenseMateDb
	(
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	databaseFileDefinitions
		"expensemate" number=51;
		setModifiedTimeStamp "mjhylkema" "18.0.01" 2020:09:28:21:15:10.311;
	defaultFileDefinition "expensemate";
	classMapDefinitions
		SExpenseMate in "_environ";
		ExpenseMate in "_usergui";
		GExpenseMate in "expensemate";
		Data in "expensemate";
		Account in "expensemate";
		User in "expensemate";
		Event in "expensemate";
		Transaction in "expensemate";
		ReoccurringDeposit in "expensemate";
		ReoccurringExpense in "expensemate";
		EventOccurrence in "expensemate";
		EventSet in "expensemate";
		ExpenseSet in "expensemate";
		TemporalAdjuster in "expensemate";
		RepeatingOccurrenceAdjuster in "expensemate";
	)
schemaViewDefinitions
exportedPackageDefinitions
typeSources
	Event (
	jadeMethodSources
create
{
create(startDate: Date; occurrence: EventOccurrence) updating;

begin
	self.startDate := startDate;
	self.occurrence := occurrence;
end;

}

nextOccurrence
{
nextOccurrence(): Date;

vars

begin
	return self.nextOccurrenceFrom(app.getUTCTime.date);
end;

}

nextOccurrenceFrom
{
nextOccurrenceFrom(fromDate: Date): Date;

vars
	nextDate: Date;
begin
	return self.occurrence.nextOccurrence(self.startDate, fromDate);
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
create(startDate: Date; occurrence: EventOccurrence)::super(startDate, occurrence) updating;

begin

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
	date.setDate(21,10,2020);
	nextDeposit := self.nextOccurrenceFrom(date);
	followingDeposit := self.nextOccurrenceFrom(nextDeposit);
	
	write "Next deposit - " & nextDeposit.display() & " (" & self.occurrence.reportOccurrence & " period ends " & followingDeposit.display() & ") covers the following expenses:";
	
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
create(name: String; startDate: Date; occurrence: EventOccurrence; cost: Decimal)::super(startDate, occurrence) updating;

begin
	self.name := name;
	self.cost := cost;
end;

}

	)
	EventOccurrence (
	jadeMethodSources
create
{
create(period: Integer; unit: Integer) updating;

begin
	self.period := period;
	self.timeUnit := unit;
end;

}

createOccurrence
{
createOccurrence(period: Integer; unit: Integer): EventOccurrence typeMethod;

vars
	occurrence: EventOccurrence;
begin
	if unit > Yearly or period < 1 then
		return null;
	endif;
	
	occurrence := create EventOccurrence(period, unit) transient;
	
	return occurrence;
end;

}

nextOccurrence
{
nextOccurrence(startDate: Date; fromDate: Date): Date;

vars
	nextDate: Date;
begin
	nextDate := startDate;

	if self.timeUnit = Daily then
	
		while nextDate < fromDate do
			nextDate := nextDate + 1;
		endwhile;
		
	elseif self.timeUnit = Weekly then
	
		while nextDate <= fromDate do
			nextDate := nextDate + 7;
		endwhile;
		
	elseif self.timeUnit = Monthly then
	
		while nextDate <= fromDate do
			if nextDate.month() < 12 then
				nextDate.setDate(nextDate.day(), nextDate.month() + 1, nextDate.year());
			else
				nextDate.setDate(nextDate.day(), 01 /* January */, nextDate.year() + 1);
			endif;
		endwhile;
		
	elseif self.timeUnit = Yearly then
	
		while nextDate <= fromDate do
			nextDate.setDate(nextDate.day(), nextDate.month(), nextDate.year() + 1);
		endwhile;
		
	endif;
	
	return nextDate;
end;

}

reportOccurrence
{
reportOccurrence(): String;

vars

begin
	if self.timeUnit = Daily then
		return EventOccurrence::Daily.getName;
	elseif self.timeUnit = Weekly then
		return EventOccurrence::Weekly.getName;
	elseif self.timeUnit = Monthly then
		return EventOccurrence::Monthly.getName;
	elseif self.timeUnit = Yearly then
		return EventOccurrence::Yearly.getName;
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
	occurrence: EventOccurrence;
	expense: ReoccurringExpense;
	monthlyDeposit: ReoccurringDeposit;
begin
	date := Date@createDate(22,10,2020);
	occurrence := EventOccurrence@createOccurrence(1, EventOccurrence.Monthly);
	monthlyDeposit := create ReoccurringDeposit(date, occurrence) transient;
	
	date := Date@createDate(27,10,2020);
	occurrence := EventOccurrence@createOccurrence(1, EventOccurrence.Weekly);
	expense := create ReoccurringExpense("Rent", date, occurrence, 200.00) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(24,10,2020);
	occurrence := EventOccurrence@createOccurrence(1, EventOccurrence.Weekly);
	expense := create ReoccurringExpense("Grocceries", date, occurrence, 100.00) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(12,11,2020);
	occurrence := EventOccurrence@createOccurrence(1, EventOccurrence.Monthly);
	expense := create ReoccurringExpense("Internet", date, occurrence, 74.95) transient;
	monthlyDeposit.addExpense(expense);
	
	date := Date@createDate(13,11,2020);
	occurrence := EventOccurrence@createOccurrence(1, EventOccurrence.Monthly);
	expense := create ReoccurringExpense("Power", date, occurrence, 80.00) transient;
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
	if self.unit = Daily then
	
		adjustedDate := date + 1;
	
	elseif self.unit = Weekly then
	
		startModulus := self.startDate.Integer mod 7;  								// 143 mod 7 = 3
		adjustedModulus := date.Integer mod 7;										// 145 mod 7 = 5
		adjustedDate := (date.Integer + 7 - adjustedModulus + startModulus).Date;	// 150 = 145 + 7 - 5 + 3
		
	elseif self.unit = Monthly then
	
		if date.day <= self.startDate.day then
			adjustedDate.setDate(self.startDate.day, date.month, date.year);
		else
			if date.month = 12 then
				adjustedDate.setDate(self.startDate.day, 1, date.year + 1);
			else
				adjustedDate.setDate(self.startDate.day, date.month + 1, date.year);
			endif;
		endif;
	
	elseif self.unit = Yearly then
	
		if date.month < self.startDate.month then
			adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year);
		elseif date.month = self.startDate.month then
			if date.day < self.startDate.day then
				adjustedDate.setDate(self.startDate.day, date.month, date.year);
			else
				adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + 1);
			endif;
		else
			adjustedDate.setDate(self.startDate.day, self.startDate.month, date.year + 1);
		endif;
	
	endif;
	
	return adjustedDate;
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
