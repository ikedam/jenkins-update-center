set BASEDIR=%~dp0
java -jar %BASEDIR%\jar\nexus-indexer-3.0.4-cli.jar -t full -n "ikedam release" -r %BASEDIR%\releases -i %BASEDIR%\releases\.index -d %BASEDIR%\releases
