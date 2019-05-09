#!/usr/bin/gawk -f

function assert(condition, string)
{
    if (! condition) {
            printf("%s:%d: assertion failed: %s\n",
                        FILENAME, FNR, string) > "/dev/stderr"
                                _assert_exit = 1
                                        exit 1
                                            }
}

END {
    if (_assert_exit)
            exit 1
}

{ 
    if($1=="\"dur\":" ) {
        printf $2;
        getline; assert($1=="\"name\":"); printf $2;
        getline; assert($1=="\"ph\":");   printf $2;
        getline; assert($1=="\"pid\":");  printf $2;
        getline; assert($1=="\"tid\":");  printf $2;
        getline; assert($1=="\"ts\":");   printf $2;
        print ""
    }
}
