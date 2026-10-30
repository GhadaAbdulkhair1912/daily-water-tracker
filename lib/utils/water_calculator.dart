double calculateWaterLitres({
  required int weightKg,
  required double activityHours,
}) {
  double baseMl = weightKg * 35.0;
  double activityMl = activityHours * 250.0;
  return (baseMl + activityMl) / 1000.0;
}