{ lib
, aiohttp
, aioresponses
, buildPythonPackage
, fetchFromGitHub
, orjson
, pytest-asyncio
, pytest-error-for-skips
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "accuweather";
  version = "2.0.0";
  format = "setuptools";

  disabled = pythonOlder "3.9";

  src = fetchFromGitHub {
    owner = "bieniu";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-elpVclH/sVQHEp3kTiwbDproJcB85F7m5sEjXwSEtNk=";
  };

  propagatedBuildInputs = [
    aiohttp
    orjson
  ];

  nativeCheckInputs = [
    aioresponses
    pytest-asyncio
    pytest-error-for-skips
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "accuweather"
  ];

  meta = with lib; {
    description = "Python wrapper for getting weather data from AccuWeather servers";
    homepage = "https://github.com/bieniu/accuweather";
    changelog = "https://github.com/bieniu/accuweather/releases/tag/${version}";
    license = licenses.asl20;
    maintainers = with maintainers; [ jamiemagee ];
  };
}
