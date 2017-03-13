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
public class Chair extends DumbFixture {
    protected Boolean seat_back;
    public Chair(String Name, double Weight, int Position, Attendant Person_in_charge, Boolean Seat_back){
        super(Name, Weight, Position, Person_in_charge);
        this.seat_back = Seat_back;
    }
    public Chair(String Name, double Weight, int Position, Robot Robot_in_charge, Boolean Seat_back){
        super(Name, Weight, Position, Robot_in_charge);
        this.seat_back = Seat_back;
    }
}
