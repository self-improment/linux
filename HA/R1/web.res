resource web{
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
