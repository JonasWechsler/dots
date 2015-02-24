cd png
INDEX=1
for f in *; do
	printf -v i "%04d" $INDEX
	echo "i:$i index:$INDEX f:$f"
	((INDEX++))
	mv "$f" "uni$i.png"
done
