package db

import (
	"time"

	monitorProtocol "github.com/adhuri/Compel-Monitoring/protocol"
)

func StoreData(agentIp string, dataReceived []monitorProtocol.ContainerStats) {

	for _, containerStat := range dataReceived {

		containerId := containerStat.ContainerID
		cpuUsage := containerStat.MetricData.CPU
		memoryUsage := containerStat.MetricData.Memory
		timestamp := containerStat.Timestamp

		dateTime := time.Unix(timestamp, 0)
		AddPoint(agentIp, containerId, cpuUsage, memoryUsage, dateTime)
	}

}
