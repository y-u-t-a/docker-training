USE sample;
SET CHARSET UTF8;

CREATE TABLE pref (
  pref_code CHAR(2) NOT NULL,
  pref_name VARCHAR(16) NOT NULL,
  version TINYINT(2) NOT NULL,
  PRIMARY KEY  (pref_code)
) DEFAULT CHARSET=utf8;