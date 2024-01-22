#/!bin/zsh

echo "number of words with at least 3 a's and don't end in 's :"
cat /usr/share/dict/words | tr "A" "a" | grep -E "(.*a.*){3,}" | grep -v "'s" | wc -l

echo "the 3 most common last 2 letters of those words: "
cat /usr/share/dict/words | tr "A" "a" | grep -E "(.*a.*){3,}" | grep -v "'s" | 
    sed -E 's/.*(..)$/\1/' | sort | uniq -c | sort | awk '{ print $2, "with count", $1 }' | tail -3

echo "2 letter combinations that do not occur in the above words: "

# can generate all pairs like: echo {a..c}{a..c}
# then, want to remove from these the pairs in the output of above. 
# how?? can do with grep!! 
cat /usr/share/dict/words | tr "A" "a" | grep -E "(.*a.*){3,}" | grep -v "'s" | 
    sed -E 's/.*(..)$/\1/' | sort | uniq > two-letter-endings.txt 
echo {a..z}{a..z} | tr " " "\n" > all-pairs.txt


echo "there are `wc -l two-letter-endings.txt` ending letter pairs from query #1, out of `wc -l all-pairs.txt` total possible pairs"

