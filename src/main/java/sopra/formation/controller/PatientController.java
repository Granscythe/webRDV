package sopra.formation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sopra.formation.model.Patient;
import sopra.formation.repository.IPatientRepository;

@Controller
public class PatientController {
	@Autowired
	private IPatientRepository patientRepo;
	
	@GetMapping("/patient") // ETAPE 1
	public String list(Model model) {
		// ETAPE 2
		List<Patient> patients = this.patientRepo.findAll();

		// ETAPE 3
		model.addAttribute("mesPatients", patients);

		// ETAPE 4
		return "patient/list";
	}

	@GetMapping("/patient/add")
	public String add() {
		// ETAPE 2 et 3 inutile
		// ETAPE 4
		return "patient/form";
	}

	@GetMapping("/patient/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		// ETAPE 2
		Patient patient = patientRepo.findById(id).get();

		// ETAPE 3
		model.addAttribute("patient", patient);

		// ETAPE 4
		return "patient/form";
	}
	
	@PostMapping("/patient/save")
	public String save(@RequestParam(required = false) Long id, @RequestParam(required = false, defaultValue = "0") int version, @RequestParam String nom, @RequestParam String prenom, @RequestParam String mail, @RequestParam String mdp, @RequestParam String numSecuriteSociale) {
		Patient patient = new Patient(id,0,nom,prenom, mail, mdp,numSecuriteSociale, null);
		patient.setVersion(version);
		
		patientRepo.save(patient);
		
		return "redirect:/patient";
	}

	@GetMapping("/patient/delete")
	public String delete(@RequestParam Long id) {
		patientRepo.deleteById(id);
		
		return "redirect:/patient";
	}
	
	@GetMapping("/patient/cancel")
	public String cancel() {
		return "forward:/patient";
	}
}
