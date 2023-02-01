<html>
    <body>
        <table border='2.2'>
            <tr><td>Target</td><td>Successor</td><td>Frequency</td></tr>
        
            {
            let $t := collection('?select=*.xml')//w[lower-case(normalize-space()) eq "has"]
            let $succ := $t/lower-case(normalize-space(following-sibling::w[1]))
            for $d in distinct-values($succ) 
            let $f := $succ[.=$d]
            order by count($f) descending
            return
            <tr>
                <td> {$t[1]} </td>
                <td> {$d} </td>
                <td> {count($f)} </td>
            </tr>
            }
        </table>
    </body>
</html>