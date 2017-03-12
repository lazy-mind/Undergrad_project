package assg2task4;


public class Robot{
    protected String name;
    protected double weight;
    protected int position;
    protected double battery_capacity;
    protected double battery_remaining;
    
    public Robot(String Name, double Weight, int Position, double Battery_capacity){
        this.name = Name;
        this.weight = Weight;
        this.position = Position;
        this.battery_capacity = Battery_capacity;
        this.battery_remaining = Battery_capacity;
    }
    
    // battery charged & consumed
    public void ChargeBattery(double Amount){
        this.battery_remaining += Amount;
        if(this.battery_remaining > this.battery_capacity){
            this.battery_remaining = this.battery_capacity
        }
        ystem.out.println(this.name + " was charged " + Amount + " battery." );
    }
    public double ConsumeBattery(double Amount){
        if(Amount >= this.battery_remaining){
            return -1;
        }
        else{
            this.battery_remaining -= Amount;
            return this.battery_remaining;
        }
    }
    
    // move fixture, move to destination, move robot it self to destination
    public double MoveTo(Room Destination){
        int distance = Math.abs(this.position - Destination.GetPosition());
        double battery_consumed = distance * this.weight;
        if (this.ConsumeBattery(battery_consumed) > 0){
            this.position = Destination.GetPosition();
            System.out.println(this.name + " moved to " + Destination.GetName() + ".");
            return battery_consumed;
            //System.out.println(this.name + " consumed " + battery_consumed + " battery." );
        }
        else{
            System.out.println("Not enough battery to move!");
            return -1
        }
    }
    public double MoveTo(Fixture Destination){
        int distance = Math.abs(this.position - Destination.GetPosition());
        double battery_consumed = distance * this.weight;
        if (this.ConsumeBattery(battery_consumed) > 0){
            this.position = Destination.GetPosition();
            System.out.println(this.name + " moved to " + Destination.GetName() + ".");
            return battery_consumed;
        }
        else{
            System.out.println("Not enough battery to move!");
            return -1
        }
    }
    public double MoveTo(Room Destination, Fixture Obj){
        int distance = Math.abs(Obj.GetPosition() - Destination.GetPosition());
        double battery_consumed = distance * Obj.GetWeight();
        if (this.ConsumeBattery(battery_consumed) > 0){
            Obj.position = Destination.GetPosition();
            System.out.println(Obj.name + " moved to " + Destination.GetName() + ".");
            return battery_consumed;
        }
        else{
            System.out.println("Not enough battery to move!");
            return -1
        }
    }
    
    // carry things to the destination
    public void CarryTo(Fixture Obj, Room Destination){
        double battery_consumed = 0;
        double amount=0;
        
        amount = this.MoveTo(Obj);
        if(amount>0){battery_consumed += amount;}
        else{
            System.out.println("Not enough battery to move!");
            return;}
        
        amount = this.MoveTo(Destination);
        if(amount>0){battery_consumed += amount;}
        else{
            System.out.println("Not enough battery to move!");
            return;}
        
        amount = this.MoveTo(Destination,Obj);
        if(amount>0){battery_consumed += amount;}
        else{
            System.out.println("Not enough battery to move!");
            return;}
        
        System.out.println(this.name + " consumed " + battery_consumed + " battery." );
        return;
    }
    
    // get the attributes
    public String GetName(){
        return this.name;
    }
    public int GetPosition(){
        return this.position;
    }
    public double GetWeight(){
        return this.weight;
    }
}






