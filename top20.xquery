<html>
    <body>
        <table border='2.2'>
            <tr><td>Target</td><td>Successor</td><td>Probabilty</td></tr>   
            {
            let $t := collection('?select=*.xml')//w[lower-case(normalize-space()) eq "has"]
            let $succ := $t/lower-case(normalize-space(following-sibling::w[1]))
            let $fullset:=for $d in distinct-values($succ) 
             let $num := count($succ[.=$d])
             let $deno := count(collection('?select=*.xml')//w[lower-case(normalize-space()) = $d])
             let $probability := $num div $deno
           order by $probability descending
            return
            <tr>
                <td> {$t[1]} </td>
                <td> {$d} </td>
                <td> {$probability} </td>
            </tr>
            return
        for $j at $k in $fullset
        where $k <= 20
            return $j
            }
        </table>
    </body>
</html>