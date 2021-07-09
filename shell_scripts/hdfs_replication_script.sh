#!/bin/bash
set -x
log_dir=/home/hdfs/hdfs_replication_log_dir
#sourceMasterUrl=hdfs://sourceurlIp:8020
#targetMasterUrl=hdfs://desturlIP:8020
#hdfsDirPath=/user/testrplica/{$i i.e subdir}

for i in reports sites
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=ingest -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

#nohup hadoop distcp -Dmapred.job.name=reports_replication -Dmapred.job.queue.name=default -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/reports/*  hdfs://<targetMasterUrl><hdfsDirPath>/reports > ${log_dir}/reports_replication.log &

for i in phone_trace maptool
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=trunk -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

for i in GIS Incident
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=stream -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

for i in IM watchman
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=default -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

sleep 15m

for i in TM MM
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=ingest -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

 
for i in emergencycallmanagement NV
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=trunk -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

for i in smallcellcommissioning algorithm
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=stream -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

for i in rmop
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=default -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

sleep 15m

for i in PP Topo
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=trunk -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

 
for i in GM
do
yarn application -list | grep "distcp: ${i}_replication" | grep 'ACCEPTED\|RUNNING'
if [[ $? -eq 1 ]]
then
#run distcp
echo Going to run $i'_replication'

nohup hadoop distcp -Dmapred.job.name=$i'_replication' -Dmapred.job.queue.name=ingest -Dmapreduce.task.timeout=6000000 -m 200 -i -bandwidth 10240 -numListstatusThreads 30 hdfs://<sourceMasterUrl><hdfsDirPath>/$i/*  hdfs://<targetMasterUrl><hdfsDirPath>/$i > ${log_dir}/${i}.log 2>&1 &

else
echo "Already running $i"
fi
done

