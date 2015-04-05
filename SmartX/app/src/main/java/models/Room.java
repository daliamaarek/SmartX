package models;

public class Room {
    private int id ;
    private String name;
    private String photo = "Photo";

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhoto() {
        return photo;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Room(String roomName) {
        name = roomName;
    }

    public Room() {
    }
}
