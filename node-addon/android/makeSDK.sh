mkdir -p ./app/lilypond/build/sdk
rm -rf ./app/lilypond/build/sdk/*

mkdir ./app/lilypond/build/sdk/lilypond
cp -r ./app/lilypond/build/intermediates/cmake/release/obj/* ./app/lilypond/build/sdk/lilypond

abi_dirs=$(find ./app/lilypond/build/sdk/lilypond -mindepth 1 -maxdepth 1 -type d)
for dir in $abi_dirs
do
	rm $dir/*.a
	rm $dir/libnode.so
	rm $dir/libc++_shared.so
	mv $dir/liblilypond-node-addon-android.so $dir/lilypond.node
done

cd ./app/lilypond/build/sdk
tar -czvf ./lilypond-android-binaries-prebuilt.tar.gz lilypond
