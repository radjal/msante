<?php 
$days = array(1=>'lundi',2=>'mardi',3=>'mercredi',4=>'jeudi',5=>'vendredi',6=>'samedi',7=>'dimanche');
//start loop for days
for($d=1;$d<=7;$d++): 
$day = $days[$d]; 
$calendar_titre=$cal_week['week_dates_iso'][$d]['dayshortname'].' '.$cal_week['week_dates_iso'][$d]['day'] ;   
$appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
$prds_count = $prds_pre_break = $prds_post_break = 0;  
//loop for day periods
foreach ( $calendar[$day] as $periods ) 
{    
        $dayopen = !strstr( $daysopenstr, $day ) ? false : true ;
        $prds_count = $periods['break'] == 'false' ? $prds_count+1 : $prds_count;
        if($periods['break'] == 'true')
        { 
                $appts_pre_break = $appts_total;
                $prds_pre_break = $prds_count; 
        }
        if(isset($periods['appointment']) && count($periods['appointment'])>0 )
        {   
                $appts_total += count($periods['appointment']); 
        }  
}  //end periods loop
//post periods loop
$appts_post_break = $appts_total - $appts_pre_break ;
$prds_post_break = $prds_count - $prds_pre_break;
?>
<div class="col-xs-3 <?=  !$dayopen ? " disabled" : '' ?>">
    <!--<div class="calendar_titre"><?= $calendar_titre ?></div>-->
        <div class="">
            
                <a 
                href="{{url:site}}doctor/view/<?= $id.'/'.$cal_week['week'].'/?c='.$this->input->get('c') ?>" 
                class="btn btn-xs <?=  $appts_total>=$prds_count ? "btn-danger " : 'btn-success '; ?><?=  $appts_total >= $prds_count ? "full" : '' ?>">
                           <?= $calendar_titre ?>
                </a>
  
        </div>
</div>  
<?php endfor; //end days loop ?> 