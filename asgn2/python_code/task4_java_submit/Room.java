package assg2task4;
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

/**
 *
 * @author kenchan
 */
public class Room {
    protected String name;
    protected int position;
    public Room(String Name, int Position){
        this.name = Name;
        this.position = Position;
    }
    public String GetName(){
        return this.name;
    }
    public int GetPosition(){
        return this.position;
    }
}
