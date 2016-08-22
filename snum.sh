rd=0
ka=0
md=0
pl=0
mm=0
rw=0
kd=0
rd2=0
ka2=0
md2=0
pl2=0
mm2=0
rw2=0
kd2=0
misc=0
misc2=0
tot=0
tot2=0
echo ''
\squeue -o '%.7i %.9P %.20j %.8u %.2t %.11M %.6D %R' | (while read x
do
  y=${x:45:3}
  if [ "$y" == '  R' ]
  then
    user="${x:36:9}"
    num=${x:64:3}
    if [ "$user" == "  rbdavid" ]
    then
      [ "${x:68:1}" == "c" ] && rd=`expr $rd + $num` || rd2=`expr $rd2 + $num`
    elif [ "$user" == "  kavotaw" ]
    then
      [ "${x:68:1}" == "c" ] && ka=`expr $ka + $num` || ka2=`expr $ka2 + $num`
    elif [ "$user" == "  mderakh" ]
    then
      [ "${x:68:1}" == "c" ] && md=`expr $md + $num` || md2=`expr $md2 + $num`
    elif [ "$user" == "   ptlake" ]
    then
      [ "${x:68:1}" == "c" ] && pl=`expr $pl + $num` || pl2=`expr $pl2 + $num`
    elif [ "$user" == "  rnw8253" ]
    then
      [ "${x:68:1}" == "c" ] && rw=`expr $rw + $num` || rw2=`expr $rw2 + $num`
    elif [ "$user" == " dupontke" ]
    then
      [ "${x:68:1}" == "c" ] && kd=`expr $kd + $num` || kd2=`expr $kd2 + $num`
    elif [ "$user" == "    mjmcc" ]
    then
      [ "${x:68:1}" == "c" ] && mm=`expr $mm + $num` || mm2=`expr $mm2 + $num`
    else
      [ "${x:68:1}" == "c" ] && misc=`expr $misc + $num` || misc2=`expr $misc2 + $num`
    fi
    [ "${x:68:1}" == "c" ] && tot=`expr $tot + $num` || tot2=`expr $tot2 + $num`
  fi
done
[ $rd -lt 10 ] && rd=" $rd"
echo "                 rbdavid:  $rd  $rd2"
[ $ka -lt 10 ] && ka=" $ka"
echo "                 kavotaw:  $ka  $ka2"
[ $md -lt 10 ] && md=" $md"
echo "                 mderakh:  $md  $md2"
[ $rw -lt 10 ] && rw=" $rw"
echo "                 rnw8253:  $rw  $rw2"
[ $kd -lt 10 ] && kd=" $kd"
echo "                dupontke:  $kd  $kd2"
[ $mm -lt 10 ] && mm=" $mm"
echo "                   mjmcc:  $mm  $mm2"
[ $pl -lt 10 ] && pl=" $pl"
echo "                  ptlake:  $pl  $pl2"
[ $misc -lt 10 ] && misc=" $misc"
[ `expr $misc + $misc2` -ne 0 ] && echo "                   other:  $misc  $misc2"
echo "                 _______________"
echo "                   total:  $tot  $tot2"
)