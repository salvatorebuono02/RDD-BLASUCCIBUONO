sig Date {}
sig Time {}

sig Name {}
sig Lastname {}
sig Password{}
//each account/registration as a passord, two can have the same password
sig Email {}
//each account as an email 
abstract sig Role{}
one sig Farmer extends Role{}
one sig Agronomist extends Role{}
one sig PolicyMaker extends Role{}

sig Location{}


sig Registration{
	name: Name,
	lastname: Lastname,
	email: Email,
	password: Password,
	role: Role,
	location: Location
}
abstract sig RegisteredUser{
	name: Name,
	lastname: Lastname,
	email: Email,
	password: Password
}

sig UnregisteredFarmer{}
sig UnregisteredPolicyMaker{}
sig UnregisteredAgronomist{}
//ogni categoria può registrarsi solo come sua categoria

sig RegisteredFarmer extends RegisteredUser{
	fields: some Field,
	totalCrop: Int
	totalSow: Int
	totalPoints: Int
	
}

sig RegisteredPolicyMaker extends RegisteredUser{
	controlledArea: Location
}

sig RegisteredAgronomist extends RegisteredUser{
	workArea: Location
}

sig Crop{}
sig Humidity{}
sig Salinity{}

sig Sensor{
	status: SensorStatus,
	type: SensorType
}


abstract sig SensorStatus{}
one sig Working extends SensorStatus{}
one sig NotActive extends SensorStatus{}

abstract sig SensorType{}
one sig HumiditySensor extends SensorType{}
one sig SalinitySensor extends SensorType{}


sig Size{}

sig Field{
	size: Size
	crop: Crop,
	location: Location,
	owner: Farmer,
	humidity: Humidity,
	salinity: Salinity,
	sensors: some Sensor,
	cropHarvest: Int,
	cropSow: Int,
	points: Int
}

abstract sig Request{
	dateTime: DateTime
}

sig ForecastRequest{
	locationRequested: Location
	Applicant: RegisteredFarmer
}

abstract sig TimeFrame{}
one sig Week extends TimeFrame{}
one sig TwoWeeks extends TimeFrame{}
one sig Month extends TimeFrame{}
one sig ThreeMonths extends TimeFrame{}
one sig Year extends TimeFrame{}

abstract sig FarmersFilter{}
one sig BestPerforming extends FarmersFilter{}
one sig WorstPerforming extends FarmersFilter{}
one sig ForecastBestPerformance extends FarmersFilter{}
one sig BestCrop extends FarmersFilter{}
//se seleziona un crop, appaiono solo farmer con quel crop e controllo relazioni

sig FarmersChartRequest{
	applicant: RegisteredPolicyMaker,
	filter: FarmersFilter,
	timeFrame: TimeFrame}





