/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * CSCI3180 Principles of Programming Languages
 *
 * --- Declaration ---
 *
 * I declare that the assignment here submitted is original except for source
 * material explicitly acknowledged. I also acknowledge that I am aware of
 * University policy and regulations on honesty in academic work, and of the
 * disciplinary guidelines and procedures applicable to breaches of such policy
 * and regulations, as contained in the website
 * http://www.cuhk.edu.hk/policy/academichonesty/
 *
 * Assignment 2
 * Name : Mao Yuxuan
 * Student ID : 1155062018
 * Email Addr : yxmao5@cse.cuhk.edu.hk
 */

package assg2task4;

/**
 *
 * @author kenchan
 */
public class Hotel {
    
    public static void MoveRoom(Object[] Obj_list, Room Destination){
        for(Object obj: Obj_list){
            if(obj instanceof Fixture){
                ((Fixture) obj).MoveTo(Destination);
            }
            else if(obj instanceof Attendant){
                ((Attendant) obj).MoveTo(Destination);
            }
            else if(obj instanceof Robot){
                ((Robot) obj).MoveTo(Destination);
            }
        }
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Robot jarvis = new Robot("Jarvis", 30, 3, 5000);
        // stuff in room 2046
        Attendant mary = new Attendant("Mary", 45, 90000, 1);
        Attendant tony = new Attendant("Tony", 60, 1000000, 1);
        Washer washer1 = new Washer("Washer 1", 55, 1, 5000);
        Refrigerator refrigerator1 = new Refrigerator("Refrigerator 1", 50, 1, 5000, 3);
        Table table1 = new Table("Table 1", 20, 1, jarvis, true);
        Chair chair1 = new Chair("Chair 1", 8, 1, jarvis, false);
        Object[] old_room_stuff = {mary, tony, washer1, refrigerator1, table1, chair1};
        // rooms
        Room old_room = new Room("Room 2046", 1);
        Room new_room = new Room("Room 2047", 5);
        DiningHall dining_hall_1 = new DiningHall("Dinning hall 1", 12, 80);
        // move all the stuff to the new room
        Hotel.MoveRoom(old_room_stuff, new_room);
        // Jarvis charge
        jarvis.ChargeBattery(500);
    }
    
}
