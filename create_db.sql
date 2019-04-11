DROP TABLE IF EXISTS FCC;

CREATE TABLE FCC(
LogRecNo NUMERIC,
Provider_Id TEXT,
FRN TEXT,
ProviderName TEXT,
DBAName TEXT,
HoldingCompanyName TEXT,
HocoNum TEXT,
HocoFinal TEXT,
StateAbbr TEXT,
BlockCode TEXT,
TechCode TEXT,
Consumer NUMERIC,
MaxAdDown NUMERIC,
MaxAdUp NUMERIC,
Business NUMERIC,
MaxCIRDown NUMERIC,
MaxCIRUp NUMERIC
);

.separator |
.import "data/fbd_us_without_satellite_jun2016_v1.psv"  FCC

DELETE TABLE IF EXISTS PROVIDER
CREATE TABLE PROVIDER
{
Provider_Id TEXT,
ProviderName TEXT,
DBAName TEXT,
HoldingCompanyName TEXT,
HocoNum TEXT,
HocoFinal TEXT,
}
