// Essai de SCMission::placeRelativeToPlayer (libRealSpace modifié, fichiers de tools/mission_ref/librealspace/src) :
// objet placé dans le repère de l'avion du joueur, pour plusieurs caps, tangages et roulis du joueur.
// Repère de libRealSpace : Y = altitude, nord vers -Z ; caps en degrés depuis le nord vers l'est.
#include <cmath>
#include <cstdio>

#include "strike_commander/precomp.h"

static int failures = 0;

static void check(const char *name, Vector3D got, Vector3D want, float heading, float wantHeading) {
    bool ok = std::fabs(got.x - want.x) < 0.01f && std::fabs(got.y - want.y) < 0.01f && std::fabs(got.z - want.z) < 0.01f;
    ok = ok && std::fabs(heading - wantHeading) < 0.5f;
    printf("%-44s position (%.2f, %.2f, %.2f), cap %.0f : %s\n", name, got.x, got.y, got.z, heading, ok ? "ok" : "ÉCHEC");
    if (!ok) {
        failures++;
    }
}

int main() {
    // Objets du jeu créés sans être détruits : leurs destructeurs libèrent des ressources que l'essai ne charge pas.
    SCMission &mission = *new SCMission();
    SCMissionActors &player = *new SCMissionActors();
    SCMissionActors &object = *new SCMissionActors();
    MISN_PART &part = *new MISN_PART();
    SCPlane &playerPlane = *new SCPlane();
    mission.player = &player;
    player.plane = &playerPlane;
    object.object = &part;
    playerPlane.x = 1000.0f;
    playerPlane.y = 2000.0f;
    playerPlane.z = 3000.0f;

    struct Case {
        const char *name;
        float playerHeading; // cap du joueur, convention des fichiers
        float pitch;         // dixièmes de degré, comme SCPlane
        float roll;          // libRealSpace : roulis positif = dessus de l'avion vers l'ouest quand il va au nord
        Vector3D offset;     // décalage lu : x = côté droit, y = haut, z = -avant
        uint16_t azymuth;
        Vector3D want;
        float wantHeading;
    };
    Case cases[] = {
        { "cap nord, 500 m devant",
          0.0f,
          0.0f,
          0.0f,
          Vector3D(0.0f, 0.0f, -500.0f),
          0,
          Vector3D(1000.0f, 2000.0f, 2500.0f),
          0.0f },
        { "cap est, 500 m devant",
          90.0f,
          0.0f,
          0.0f,
          Vector3D(0.0f, 0.0f, -500.0f),
          0,
          Vector3D(1500.0f, 2000.0f, 3000.0f),
          90.0f },
        { "cap est, 200 m à droite",
          90.0f,
          0.0f,
          0.0f,
          Vector3D(200.0f, 0.0f, 0.0f),
          0,
          Vector3D(1000.0f, 2000.0f, 3200.0f),
          90.0f },
        { "cap sud, 300 m derrière, cap fichier 90",
          180.0f,
          0.0f,
          0.0f,
          Vector3D(0.0f, 0.0f, 300.0f),
          90,
          Vector3D(1000.0f, 2000.0f, 2700.0f),
          270.0f },
        { "cap nord, tangage 45, 100 m devant",
          0.0f,
          450.0f,
          0.0f,
          Vector3D(0.0f, 0.0f, -100.0f),
          0,
          Vector3D(1000.0f, 2070.71f, 2929.29f),
          0.0f },
        { "cap nord, roulis 90, 100 m au-dessus",
          0.0f,
          0.0f,
          900.0f,
          Vector3D(0.0f, 100.0f, 0.0f),
          0,
          Vector3D(900.0f, 2000.0f, 3000.0f),
          0.0f },
    };
    for (Case &c : cases) {
        playerPlane.yaw = norm3600((360.0f - c.playerHeading) * 10.0f);
        playerPlane.pitch = c.pitch;
        playerPlane.roll = c.roll;
        part.relative_position = c.offset;
        part.relative_azymuth = c.azymuth;
        mission.placeRelativeToPlayer(&object);
        check(c.name, part.position, c.want, (float)part.azymuth, c.wantHeading);
    }
    printf("%d échec(s)\n", failures);
    return failures == 0 ? 0 : 1;
}
