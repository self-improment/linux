resource web{
	net{
		protocol C;
		allow-two-primaries yes;
	}
	startup{
		become-primary-on both;
	}
	disk{
		fencing resource-and-stonith;
	}
	handlers{
		#Make sure the other node is confirmed
		#dead after this!
		outdate-peer "/sbin/kill-other-node.sh";
	on node01.local{
		device	/dev/drbd0;
		disk	/dev/sdb;
		address	10.0.2.1:7789;
		meta-disk	internal;
	}
	
	on node02.local{
                device  /dev/drbd0;
                disk    /dev/sdb;
                address 10.0.2.2:7789;
                meta-disk       internal;
        }
}
