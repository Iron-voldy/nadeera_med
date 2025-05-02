package com.doctormanagement.util;

import com.doctormanagement.model.Doctor;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    public static void addDoctor(Doctor doctor, String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, true))) {
            writer.write(doctor.getId() + "," + doctor.getName() + "," + doctor.getSpecialty() + "," +
                    doctor.getPhone() + "," + doctor.getEmail() + "," + doctor.getAddress() + "," +
                    doctor.getPhotoFileName());
            writer.newLine();
        }
    }

    public static List<Doctor> getAllDoctors(String filePath) throws IOException {
        List<Doctor> doctors = new ArrayList<>();
        File file = new File(filePath);
        if (!file.exists()) {
            return doctors;
        }
        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                Doctor doctor = new Doctor(Integer.parseInt(parts[0]), parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]);
                doctors.add(doctor);
            }
        }
        return doctors;
    }

    public static Doctor getDoctorById(int id, String filePath) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (Integer.parseInt(parts[0]) == id) {
                    return new Doctor(Integer.parseInt(parts[0]), parts[1], parts[2], parts[3], parts[4], parts[5], parts[6]);
                }
            }
        }
        return null;
    }

    public static void updateDoctor(Doctor updatedDoctor, String filePath) throws IOException {
        List<Doctor> doctors = getAllDoctors(filePath);
        for (int i = 0; i < doctors.size(); i++) {
            if (doctors.get(i).getId() == updatedDoctor.getId()) {
                doctors.set(i, updatedDoctor);
                break;
            }
        }
        writeAllDoctors(doctors, filePath);
    }

    public static void deleteDoctor(int id, String filePath) throws IOException {
        List<Doctor> doctors = getAllDoctors(filePath);
        doctors.removeIf(doctor -> doctor.getId() == id);
        writeAllDoctors(doctors, filePath);
    }

    private static void writeAllDoctors(List<Doctor> doctors, String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            for (Doctor doctor : doctors) {
                writer.write(doctor.getId() + "," + doctor.getName() + "," + doctor.getSpecialty() + "," +
                        doctor.getPhone() + "," + doctor.getEmail() + "," + doctor.getAddress() + "," +
                        doctor.getPhotoFileName());
                writer.newLine();
            }
        }
    }
}