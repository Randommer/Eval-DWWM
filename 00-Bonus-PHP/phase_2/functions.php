<?php
    // -- Exo 1
    /**
     * @param $class
     * @return bool
     */
    function checkClass($class)
    {
        $class_name = get_class($class);
        if ($class_name == false)
        {
            return false;
        }
        else
        {
            $class_acceptees = ['Foo', 'User', 'Country'];
            if (is_integer(array_search($class_name, $class_acceptees)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    // -- Exo 2
    /**
     * @param $word
     * @return bool
     */
    function checkAnagramme($word)
    {
        if (strlen($word) == strlen("ravie"))
        {
            $word = strtolower($word);
            $ravie = ['r', 'a', 'v', 'i', 'e'];
            for ($i = 0; $i < strlen($word); $i++)
            {
                $k = array_search($word{$i}, $ravie);
                if (is_integer($k))
                {
                    array_slice($ravie, $k, 1);
                }
                else
                {
                    return false;
                }
            }
        }
        else
        {
            return false;
        }
        return true;
    }

    // -- Exo 4
    /**
     * @param $word
     * @return bool
     */
    function checkPalindrome($word) {
        $word = strtolower($word);
        for ($i = 0; $i < intdiv(strlen($word), 2); $i++)
        {
            if ($word{$i} != $word{strlen($word)-1-$i})
            {
                return false;
            }
        }
        return true;
    }

    // -- Exo 5
    /**
     * @param $word
     * @return string
     */
    function checkBlackBox($word) {
        $convert = [
            [
                'a', 'b', 'c', 'd', 'e',
                'f', 'g', 'h', 'i', 'j',
                'k', 'l', 'm', 'n', 'o',
                'p', 'q', 'r', 's', 't',
                'u', 'v', 'w', 'x', 'y',
                'z',
                '1', '2', '3', '4',
                '6',      '8', '9'
            ],
            [
                'b', 'c', 'd', 'e', 'f',
                'g', 'h', 'i', 'j', 'k',
                'l', 'm', 'n', 'o', 'p',
                'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z',
                'a',
                '87', '14', '21',  '2',
                '42',       '56', '63'
            ]];
        $double = [
            'a' => 'b', 'b' => 'c', 'c' => 'd',
            'd' => 'e', 'e' => 'f', 'f' => 'g',
            'g' => 'h', 'h' => 'i', 'i' => 'j',
            'j' => 'k', 'k' => 'l', 'l' => 'm',
            'm' => 'n', 'n' => 'o', 'o' => 'p',
            'p' => 'q', 'q' => 'r', 'r' => 's',
            's' => 't', 't' => 'u', 'u' => 'v',
            'v' => 'w', 'w' => 'x', 'x' => 'y',
            'y' => 'z', 'z' => 'a',

            '1' => '87', '2' => '14', '3' => '21',
            '4' =>  '2', '6' => '42',
            '8' => '56', '9' => '63'
        ];
        $password = "";
        for ($i = 0; $i < strlen($word); $i++)
        {
            //avec $convert
            $k = array_search($word{$i}, $convert[0]);
            if (is_integer($k))
            {
                $password = $password.$convert[1][$k];
            }
            else
            {
                $password = $password."a";
            }

            /* //avec $double
            if (array_key_exists($word{$i}, $double))
            {
                $password = $password.$double[$word{$i}];
            }
            else
            {
                $password = $password."a";
            }
            */
        }
        return $password;
    }