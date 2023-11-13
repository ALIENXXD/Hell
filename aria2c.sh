if [ -z $TORRENT_TIMEOUT ]
then
   TORRENT_TIMEOUT=0
fi
tracker_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt https://ngosang.github.io/trackerslist/trackers_all_http.txt https://newtrackon.com/api/all https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_tracker.txt | awk '$0' | tr '\n\n' ',')
aria2c --allow-overwrite=true --auto-file-renaming=true \
       --check-certificate=false \
       --check-integrity=true --continue=true --content-disposition-default-utf8=true --daemon=true \
       --disk-cache=40M --enable-rpc=true --force-save=true --http-accept-gzip=true \
       --max-connection-per-server=10 --max-concurrent-downloads=10 --max-file-not-found=0 --max-tries=20 \
       --min-split-size=10M --optimize-concurrent-downloads=true --reuse-uri=true \
        --quiet=true --rpc-max-request-size=1024M --enable-peer-exchange=false --follow-torrent=false --split=10 \
       --summary-interval=0 --user-agent=Wget/1.12
