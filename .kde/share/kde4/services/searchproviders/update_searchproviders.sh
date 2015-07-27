# source script from searchproviders directory

for f in ~/.kde/share/kde4/services/searchproviders/*; do
    ln $f ./
done

