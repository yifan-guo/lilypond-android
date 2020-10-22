mkdir -p ./app/lilypond/build/sdk
rm -rf ./app/lilypond/build/sdk/*
mkdir ./app/lilypond/build/sdk/lilypond


# make include/
mkdir ./app/lilypond/build/sdk/lilypond/include
cp ../include/lilypond-ex.hh ./app/lilypond/build/sdk/lilypond/include
cp ../include/buffer.hh ./app/lilypond/build/sdk/lilypond/include


# make bin/
mkdir ./app/lilypond/build/sdk/lilypond/bin
cp -r ./app/lilypond/build/intermediates/cmake/release/obj/* ./app/lilypond/build/sdk/lilypond/bin

abi_dirs=$(find ./app/lilypond/build/sdk/lilypond/bin -mindepth 1 -maxdepth 1 -type d)
for dir in $abi_dirs
do
	rm $dir/*.a
	rm $dir/libnode.so
	rm $dir/libc++_shared.so
	mv $dir/liblilypond-node-addon-android.so $dir/lilypond.node
done


# pack
cd ./app/lilypond/build/sdk
tar -czvf ./lilypond-android-binaries-prebuilt.tar.gz lilypond
