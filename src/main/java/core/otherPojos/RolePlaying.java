package core.otherPojos;

public class RolePlaying {
    private int roleId;
    private String actorName;
    private String characterName;

    public RolePlaying(int roleId, String actorName, String characterName) {
        this.roleId = roleId;
        this.actorName = actorName;
        this.characterName = characterName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

    public String getCharacterName() {
        return characterName;
    }

    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }
}
