{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, pytestCheckHook
, numpy
, pythonOlder
, six
}:

buildPythonPackage rec {
  pname = "py-stringmatching";
  version = "0.4.3";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "py_stringmatching";
    inherit version;
    hash = "sha256-khubsWOzEN80HDOCORMgT3sMqfajGfW0UUCDAL03je4=";
  };

  nativeBuildInputs = [
    setuptools
  ];

  propagatedBuildInputs = [
    numpy
    six
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  preCheck = ''
    cd $out
  '';

  pythonImportsCheck = [
    "py_stringmatching"
  ];

  meta = with lib; {
    description = "Python string matching library including string tokenizers and string similarity measures";
    homepage = "https://github.com/anhaidgroup/py_stringmatching";
    changelog = "https://github.com/anhaidgroup/py_stringmatching/blob/v${version}/CHANGES.txt";
    license = licenses.bsd3;
    maintainers = with maintainers; [ ixxie ];
  };
}
