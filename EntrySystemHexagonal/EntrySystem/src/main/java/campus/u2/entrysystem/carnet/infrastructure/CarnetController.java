package campus.u2.entrysystem.carnet.infrastructure;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/carnet")
public class CarnetController {
//    package campus.u2.entrysystem.carnet.application;
//
//import campus.u2.entrysystem.carnet.domain.Carnet;
//import campus.u2.entrysystem.people.domain.People;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/carnet")
//public class CarnetController {
//
//    private final CarnetService carnetService;
//
//    @Autowired
//    public CarnetController(CarnetService carnetService) {
//        this.carnetService = carnetService;
//    }
//
//    // To create a new carnet
//    @PostMapping("/create")
//    public ResponseEntity<Carnet> createCarnet() {
//        Carnet carnet = carnetService.createCarnet();
//        return ResponseEntity.ok(carnet);
//    }
//
//    // To save a carnet
//    @PostMapping("/")
//    public ResponseEntity<Carnet> saveCarnet(@RequestBody Carnet carnet) {
//        Carnet savedCarnet = carnetService.saveCarnet(carnet);
//        return ResponseEntity.ok(savedCarnet);
//    }
//
//    // To save a carnet for a person
//    @PostMapping("/person/{idPerson}")
//    public ResponseEntity<Carnet> saveCarnetForPerson(@PathVariable Long idPerson, @RequestBody Carnet carnet) {
//        People people = new People(); // Aquí debes recuperar el objeto People por idPerson, si es necesario
//        people.setId(idPerson);
//        Carnet savedCarnet = carnetService.saveCarnetForPerson(people, carnet);
//        return ResponseEntity.ok(savedCarnet);
//    }
//
//    // To show all the carnets
//    @GetMapping("/")
//    public ResponseEntity<List<Carnet>> getAllCarnets() {
//        List<Carnet> carnets = carnetService.getAllCarnets();
//        return ResponseEntity.ok(carnets);
//    }
//
//    // To find a carnet by ID
//    @GetMapping("/{id}")
//    public ResponseEntity<Carnet> getCarnetById(@PathVariable Long id) {
//        Carnet carnet = carnetService.getCarnetById(id);
//        return ResponseEntity.ok(carnet);
//    }
//
//    // To find a carnet by People
//    @GetMapping("/person/{idPerson}")
//    public ResponseEntity<Carnet> findCarnetByPeople(@PathVariable Long idPerson) {
//        People people = new People(); // Aquí también debes recuperar el objeto People por idPerson
//        people.setId(idPerson);
//        Carnet carnet = carnetService.findCarnetByPeople(people);
//        return ResponseEntity.ok(carnet);
//    }
//}
// // To update the status of the carnet
//    @PutMapping("/{carnetId}/status")
//    public ResponseEntity<Carnet> updateCarnetStatus(@PathVariable Long carnetId, @RequestParam boolean newStatus) {
//        Carnet updatedCarnet = carnetService.updateCarnetStatus(carnetId, newStatus);
//        return ResponseEntity.ok(updatedCarnet);
//    }
}
