package ra.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    private Long user_id;
    private String full_name;
    private Long phone;
    private String address;
    private Boolean status;
    private Long role_id;
}
