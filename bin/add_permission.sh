for f in $(find ./bin/ -type f)
do
  chmod +x $f
done

echo 'Added permissions'
