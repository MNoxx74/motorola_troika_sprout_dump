echo "EXECUTING UPDOWN SCRIPT"
echo "PLUTO_VERB: ${PLUTO_VERB}"
case "${PLUTO_VERB}" in
	up-client-v6)
		echo "IPv6 CLIENT UP EVENT, Adding PCSCF Specific routes"
		echo "PLUTO_PCSCF6_IP: ${PLUTO_PCSCF6_IP}"
		IFS=';'
		for i in ${PLUTO_PCSCF6_IP}; do
	    	echo "Adding route for PCSCF-IP $i"
			ip -6 r a $i dev wlan0  proto static  src ${PLUTO_MY_ACTIVE_CLIENT} table local
		done
		;;
	down-client-v6)
		echo "IPv6 CLIENT DOWN EVENT, DELETING PCSCF Specific routes"
		echo "PLUTO_PCSCF6_IP: ${PLUTO_PCSCF6_IP}"
		IFS=';'
		for i in ${PLUTO_PCSCF6_IP}; do
	    	echo "Deleting route for PCSCF-IP $i"
			ip -6 r d $i dev wlan0  proto static  src ${PLUTO_MY_ACTIVE_CLIENT} table local
		done
		;;
esac
