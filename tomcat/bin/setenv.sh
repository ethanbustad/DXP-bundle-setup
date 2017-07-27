CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF8 -Djava.net.preferIPv4Stack=true  -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT -Xms4096m -Xmx4096m -XX:MaxNewSize=2048m -XX:NewSize=2048m -XX:ReservedCodeCacheSize=128m"

JAVA_OPTS="$JAVA_OPTS -XX:MaxTenuringThreshold=0 -XX:SurvivorRatio=65536 -XX:TargetSurvivorRatio=0"

JAVA_OPTS="$JAVA_OPTS -server -d64"

JAVA_OPTS="$JAVA_OPTS  -Xss768K -XX:+DisableExplicitGC -XX:+UseBiasedLocking"

JAVA_OPTS="$JAVA_OPTS -XX:+CMSConcurrentMTEnabled -XX:+CMSCompactWhenClearAllSoftRefs -XX:CMSInitiatingOccupancyFraction=80 -XX:+CMSParallelRemarkEnabled -XX:+CMSScavengeBeforeRemark -XX:+UseConcMarkSweepGC -XX:+UseCompressedOops"

JAVA_OPTS="$JAVA_OPTS -XX:ParallelCMSThreads=4 -XX:ParallelGCThreads=8 -XX:+UseParNewGC"
