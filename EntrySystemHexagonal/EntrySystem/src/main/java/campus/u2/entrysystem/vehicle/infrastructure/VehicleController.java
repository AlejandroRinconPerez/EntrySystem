package campus.u2.entrysystem.vehicle.infrastructure;

import campus.u2.entrysystem.vehicle.application.VehicleService;
import campus.u2.entrysystem.vehicle.domain.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/vehicle")
public class VehicleController {

    private final VehicleService vehicleService;

    @Autowired
    public VehicleController(VehicleService vehicleService) {
        this.vehicleService = vehicleService;
    }

    @GetMapping
    public List<Vehicle> getAllVehicles() {
        return vehicleService.getAllVehicles();
    }

    @GetMapping("/{idVehicle}")
    public Optional<Vehicle> findbyId(@PathVariable Long idVehicle) {
        return vehicleService.findbyId(idVehicle);
    }

    @GetMapping("/plate/{plate}")
    public Optional<Vehicle> findByPlate(@PathVariable String plate) {
        return vehicleService.findVehicleByPlate(plate);
    }

    @PostMapping
    public Vehicle saveVehicle(@RequestBody Vehicle vehicle) {
        return vehicleService.saveVehicle(vehicle);
    }

    @DeleteMapping("/{idVehicle}")
    public void deleteVehicle(@PathVariable Long idVehicle) {
        vehicleService.deleteVehicle(idVehicle);
    }
}

