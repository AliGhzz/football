import 'package:flutter/material.dart';
import 'package:football/core/utils/get_converted_time.dart';
import 'package:football/features/matches/data/models/leagues/status.dart';
import 'package:gap/gap.dart';

Widget timeOrScore(Status status, BuildContext context){
  TextTheme textTheme = Theme.of(context).textTheme;
  //The match will start at the scheduled time
  if(status.started == false && status.cancelled!=null && status.cancelled==false){ 
    return SizedBox(
      width: 50,    
      child: Center(
        child: Text(
          extractHourAndMinute(status.utcTime.toString()),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            letterSpacing: 0,
          ),
          overflow: TextOverflow.ellipsis, 
          maxLines: 1, 
        ),
      ),
    );
  //The match has been canceled and will be held at a later time.
  }else if(status.started == false && status.cancelled!=null){
    return SizedBox( 
      width: 50,      
      child: Center(  
        child: Text(
          extractHourAndMinute(status.utcTime.toString()),  
          style: const TextStyle(color: Colors.grey, fontSize: 13,decoration: TextDecoration.lineThrough,decorationThickness: 1,decorationColor: Colors.grey),
          overflow: TextOverflow.ellipsis, 
          maxLines: 1, 

        ),
      ),
    );

  //The match took place, but the result of the game has been nullified
  }else if(status.cancelled!=null  && status.cancelled==true  && status.started==true  && status.finished==true){
    return SizedBox(
      width: 50,     
      child: Center( 
        child: Text(
          status.scoreStr.toString(),  
          style: const TextStyle(color: Colors.white, fontSize: 14,decoration: TextDecoration.lineThrough,decorationThickness: 1,decorationColor: Colors.white),
          overflow: TextOverflow.ellipsis, 
          maxLines: 1, 

        ),
      ), 
    );
  }else if(status.started == true && status.cancelled!=null  &&  status.cancelled==false ) {
   
    if(status.aggregatedStr!=null){
      return SizedBox(
        width: 50, 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(status.numberOfHomeRedCards!=null || status.numberOfAwayRedCards!=null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly , 
              children: [
                if(status.numberOfHomeRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfHomeRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration( 
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                ), 
                if(status.numberOfHomeRedCards==null && status.numberOfAwayRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfAwayRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration( 
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                ), 
                if(status.numberOfAwayRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
            
                  children: List.generate(status.numberOfAwayRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(right: 1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2)   
                      ),
                    );
                  },),
                ),
                if(status.numberOfAwayRedCards==null && status.numberOfHomeRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfHomeRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration( 
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                ), 
              ],
            ),
            Text(
              status.scoreStr.toString(),
              style: textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis, 
              maxLines: 1,
            ),
            Text("(${status.aggregatedStr})",style: const TextStyle(fontSize: 12,color: Colors.grey),),
            if(status.numberOfHomeRedCards!=null || status.numberOfAwayRedCards!=null)
              const Gap(8)
          ],
        ),
      ); 
    } 
    return SizedBox(
        width: 50,    
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(status.numberOfHomeRedCards!=null || status.numberOfAwayRedCards!=null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly , 
              children: [
                if(status.numberOfHomeRedCards!=null) 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfHomeRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration(  
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                ), 
                if(status.numberOfHomeRedCards==null && status.numberOfAwayRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfAwayRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration( 
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                ), 
                if(status.numberOfAwayRedCards!=null) 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
            
                  children: List.generate(status.numberOfAwayRedCards!, (index) {
                    return Container(
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(right: 1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(2)   
                      ),
                    );
                  },),
                ),
                if(status.numberOfAwayRedCards==null && status.numberOfHomeRedCards!=null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(status.numberOfHomeRedCards!, (index) {
                    return Container( 
                      height: 8,width: 5,
                      margin: const EdgeInsets.only(left: 1),
                      decoration: BoxDecoration( 
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2)  
                      ), 
                    );
                  },),
                  
                ), 
              ],
            ),
              Text(
                status.scoreStr.toString(),
                style: textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis, 
                maxLines: 1,
              ),
              if(status.numberOfHomeRedCards!=null || status.numberOfAwayRedCards!=null)
              const Gap(8)
            ],
          ),
        ),
    );
  }
  return const SizedBox.shrink();
}